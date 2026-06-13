"""SQL runners for end-to-end tests: execute compiled SQL against real engines.

Each runner takes a SQL script (possibly multi-statement, as produced by
``synalog.compile``) and returns the rows of the last statement that produced
a result set, as a list of tuples.

Runners reproduce the runtime environment upstream Python Logica provides on
its own connections:
  - sqlite: Logica's UDFs (ArgMin/ArgMax, ARRAY_CONCAT, IN_LIST, Split, ...)
    registered via ``logica.common.sqlite3_logica``.
  - duckdb: an ``ARRAY_CONCAT_AGG`` macro (flatten + list).
  - psql:   an ``ARRAY_CONCAT_AGG`` aggregate (array_cat).
  - all:    a ``CurrentDate(date)`` relation when the program references the
    CurrentDate built-in concept.
"""

from __future__ import annotations

import os
import sqlite3


def _split_statements(sql: str) -> list[str]:
    """Split a script on top-level semicolons (quote-aware).

    @Ground fixtures compile to multi-statement scripts (DROP TABLE; CREATE
    TABLE AS ...; SELECT ...) but the Trino/Presto REST clients only accept
    one statement per execute.
    """
    statements, current, in_string = [], [], False
    for ch in sql:
        if ch == "'":
            in_string = not in_string
        if ch == ";" and not in_string:
            statement = "".join(current).strip()
            if statement:
                statements.append(statement)
            current = []
        else:
            current.append(ch)
    tail = "".join(current).strip()
    if tail:
        statements.append(tail)
    return statements


def _needs_current_date(sql: str) -> bool:
    return "CurrentDate" in sql


class SqliteRunner:
    """In-process SQLite with Logica's runtime UDFs registered."""

    engine = "sqlite"

    def run(self, sql: str) -> list[tuple]:
        from logica.common import sqlite3_logica

        conn = sqlite3.connect(":memory:")
        sqlite3_logica.ExtendConnectionWithLogicaFunctions(conn)
        try:
            if _needs_current_date(sql):
                conn.execute("CREATE TABLE CurrentDate AS SELECT date('now') AS date")
            rows: list[tuple] = []
            for statement in self._split(sql):
                cur = conn.execute(statement)
                if cur.description is not None:
                    rows = cur.fetchall()
            return rows
        finally:
            conn.close()

    @staticmethod
    def _split(sql: str) -> list[str]:
        """Split a script into statements using sqlite's own tokenizer."""
        statements, current = [], ""
        for line in sql.splitlines(keepends=True):
            current += line
            if sqlite3.complete_statement(current):
                if current.strip():
                    statements.append(current)
                current = ""
        if current.strip():
            statements.append(current)
        return statements


class DuckDbRunner:
    """In-process DuckDB (pip package)."""

    engine = "duckdb"

    def run(self, sql: str) -> list[tuple]:
        import duckdb

        conn = duckdb.connect(":memory:")
        try:
            conn.execute(
                "CREATE MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))"
            )
            if _needs_current_date(sql):
                conn.execute(
                    "CREATE TABLE CurrentDate AS"
                    " SELECT strftime(current_date, '%Y-%m-%d') AS date"
                )
            # duckdb executes multi-statement scripts and returns the last result.
            return conn.execute(sql).fetchall()
        finally:
            conn.close()


class PostgresRunner:
    """PostgreSQL over psycopg3. Each run gets a throwaway schema-less session;
    logica preambles use ``create ... if not exists`` so reruns are idempotent."""

    engine = "psql"

    def __init__(self, dsn: str):
        self.dsn = dsn

    def run(self, sql: str) -> list[tuple]:
        import psycopg

        with psycopg.connect(self.dsn, autocommit=True) as conn:
            with conn.cursor() as cur:
                cur.execute(
                    "CREATE OR REPLACE AGGREGATE ARRAY_CONCAT_AGG(anycompatiblearray)"
                    " (SFUNC = array_cat, STYPE = anycompatiblearray)"
                )
                if _needs_current_date(sql):
                    cur.execute(
                        "CREATE TABLE IF NOT EXISTS CurrentDate AS"
                        " SELECT to_char(current_date, 'YYYY-MM-DD') AS date"
                    )
                cur.execute(sql)
                rows: list[tuple] = []
                while True:
                    if cur.description is not None:
                        rows = cur.fetchall()
                    if not cur.nextset():
                        break
                return rows


class TrinoRunner:
    """Trino over its REST client."""

    engine = "trino"

    def __init__(self, host: str, port: int):
        self.host = host
        self.port = port

    def run(self, sql: str) -> list[tuple]:
        import trino

        conn = trino.dbapi.connect(
            host=self.host, port=self.port, user="e2e", catalog="memory", schema="default"
        )
        try:
            cur = conn.cursor()
            for statement in self._setup_statements(sql):
                cur.execute(statement)
                cur.fetchall()
            rows: list[tuple] = []
            for statement in _split_statements(sql):
                cur.execute(statement)
                fetched = cur.fetchall()
                if cur.description is not None:
                    rows = [tuple(r) for r in fetched]
            return rows
        finally:
            conn.close()

    @staticmethod
    def _setup_statements(sql: str) -> list[str]:
        statements = []
        if "logica_test." in sql:  # @Ground writes into this schema
            statements.append("CREATE SCHEMA IF NOT EXISTS memory.logica_test")
        if _needs_current_date(sql):
            statements.append(
                "CREATE TABLE IF NOT EXISTS currentdate AS"
                " SELECT CAST(current_date AS VARCHAR) AS date"
            )
        return statements


class PrestoRunner(TrinoRunner):
    """PrestoDB over its REST client.

    Same protocol as Trino, but the client returns ARRAY/MAP columns as JSON
    strings; decode them so results compare equal to engines with native
    client-side arrays.
    """

    engine = "presto"

    def run(self, sql: str) -> list[tuple]:
        import prestodb

        conn = prestodb.dbapi.connect(
            host=self.host, port=self.port, user="e2e", catalog="memory", schema="default"
        )
        try:
            cur = conn.cursor()
            for statement in self._setup_statements(sql):
                cur.execute(statement)
                cur.fetchall()
            rows: list[tuple] = []
            for statement in _split_statements(sql):
                cur.execute(statement)
                fetched = cur.fetchall()
                if cur.description is not None:
                    rows = self._decode(fetched, cur.description)
            return rows
        finally:
            conn.close()

    @staticmethod
    def _decode(rows, description) -> list[tuple]:
        import json
        from decimal import Decimal

        json_cols = [
            i
            for i, col in enumerate(description)
            if col[1] and col[1].startswith(("array", "map"))
        ]
        decimal_cols = [
            i
            for i, col in enumerate(description)
            if col[1] and col[1].startswith("decimal")
        ]
        decoded = []
        for row in rows:
            row = list(row)
            for i in json_cols:
                if isinstance(row[i], str):
                    row[i] = json.loads(row[i])
            for i in decimal_cols:
                if isinstance(row[i], str):
                    row[i] = Decimal(row[i])
            decoded.append(tuple(row))
        return decoded


def make_runner(engine: str):
    """Build the runner for `engine`, reading connection info from env vars."""
    if engine == "sqlite":
        return SqliteRunner()
    if engine == "duckdb":
        return DuckDbRunner()
    if engine == "psql":
        dsn = os.environ.get(
            "SYNALOG_E2E_PSQL_DSN",
            "postgresql://logica:logica@localhost:{}/logica".format(
                os.environ.get("SYNALOG_E2E_PSQL_PORT", "5433")
            ),
        )
        return PostgresRunner(dsn)
    if engine == "trino":
        return TrinoRunner(
            os.environ.get("SYNALOG_E2E_TRINO_HOST", "localhost"),
            int(os.environ.get("SYNALOG_E2E_TRINO_PORT", "8080")),
        )
    if engine == "presto":
        return PrestoRunner(
            os.environ.get("SYNALOG_E2E_PRESTO_HOST", "localhost"),
            int(os.environ.get("SYNALOG_E2E_PRESTO_PORT", "8081")),
        )
    raise ValueError(f"No e2e runner for engine '{engine}'")
