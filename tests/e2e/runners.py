"""SQL runners for end-to-end tests: execute compiled SQL against real engines.

Each runner opens a session (one connection) per call: ``run(sql)`` runs a
script (as ``synalog.compile`` returns), ``run_plan(steps)`` a plan (as
``synalog.plan`` returns: each recursion's loop stops when it converges, with
synalog's own loop, ``synalog.runners.run_plan``). Both return the rows of the
last statement that produced a result set, as a list of tuples.

Runners reproduce the runtime environment upstream Python Logica provides on
its own connections:
  - sqlite: Logica's UDFs (ArgMin/ArgMax, ARRAY_CONCAT, IN_LIST, Split, ...)
    registered via ``logica.common.sqlite3_logica``.
  - duckdb: an ``ARRAY_CONCAT_AGG`` macro (flatten + list).
  - psql:   an ``ARRAY_CONCAT_AGG`` aggregate (array_cat).

The ``Today``/``Now`` built-in concepts no longer need a runtime table — the
compiler inlines them per dialect.
"""

from __future__ import annotations

import os
import sqlite3


from synalog.runners import run_plan as _run_plan
from synalog.runners import split_statements as _split_statements


class Runner:
    engine = ""

    def run(self, sql: str) -> list[tuple]:
        return self.run_plan([{"kind": "sql", "sql": sql}])

    def run_plan(self, steps: list[dict]) -> list[tuple]:
        session = self.session()
        try:
            return _run_plan(steps, session)[1]
        finally:
            session.close()

    def session(self):
        raise NotImplementedError


class _Session:
    """``run(script) -> (columns, rows)`` over one connection."""

    def run(self, script: str) -> tuple[list[str], list[tuple]]:
        columns: list[str] = []
        rows: list[tuple] = []
        for statement in self.split(script):
            result = self.execute(statement)
            if result is not None:
                columns, rows = result
        return columns, rows

    split = staticmethod(_split_statements)


class SqliteRunner(Runner):
    """In-process SQLite with Logica's runtime UDFs registered."""

    engine = "sqlite"

    def session(self):
        import re

        from logica.common import sqlite3_logica

        conn = sqlite3.connect(":memory:")
        sqlite3_logica.ExtendConnectionWithLogicaFunctions(conn)
        # `search` compiles to the SQLite REGEXP operator (`X REGEXP Y` →
        # `regexp(Y, X)`), which stdlib sqlite3 leaves undefined.
        conn.create_function(
            "REGEXP",
            2,
            lambda pattern, value: value is not None and re.search(pattern, value) is not None,
        )
        # As synalog's own SQLite sessions: Unicode UPPER/LOWER, case-sensitive LIKE.
        from synalog.runners import sqlite_semantics

        sqlite_semantics(conn)

        class Session(_Session):
            split = staticmethod(SqliteRunner._split)

            def execute(self, statement):
                cur = conn.execute(statement)
                return ([d[0] for d in cur.description], cur.fetchall()) if cur.description else None

            def close(self):
                conn.close()

        return Session()

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


class DuckDbRunner(Runner):
    """In-process DuckDB (pip package)."""

    engine = "duckdb"

    def session(self):
        import duckdb

        conn = duckdb.connect(":memory:")
        conn.execute("CREATE MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))")

        class Session(_Session):
            def run(self, script):
                # duckdb executes multi-statement scripts and returns the last result.
                cur = conn.execute(script)
                if cur is None or cur.description is None:
                    return [], []
                return [d[0] for d in cur.description], cur.fetchall()

            def close(self):
                conn.close()

        return Session()


class PostgresRunner(Runner):
    """PostgreSQL over psycopg3. Each session is a throwaway connection;
    logica preambles use ``create ... if not exists`` so reruns are idempotent."""

    engine = "psql"

    def __init__(self, dsn: str):
        self.dsn = dsn

    def session(self):
        import psycopg

        conn = psycopg.connect(self.dsn, autocommit=True)
        cur = conn.cursor()
        cur.execute(
            "CREATE OR REPLACE AGGREGATE ARRAY_CONCAT_AGG(anycompatiblearray)"
            " (SFUNC = array_cat, STYPE = anycompatiblearray)"
        )

        class Session(_Session):
            def run(self, script):
                cur.execute(script)
                columns, rows = [], []
                while True:
                    if cur.description is not None:
                        columns = [d[0] for d in cur.description]
                        rows = cur.fetchall()
                    if not cur.nextset():
                        break
                return columns, rows

            def close(self):
                conn.close()

        return Session()


class TrinoRunner(Runner):
    """Trino over its REST client, which takes one statement per execute."""

    engine = "trino"

    def __init__(self, host: str, port: int):
        self.host = host
        self.port = port

    def connect(self):
        import trino

        return trino.dbapi.connect(
            host=self.host, port=self.port, user="e2e", catalog="memory", schema="default"
        )

    # @Ground writes into this schema.
    setup = "CREATE SCHEMA IF NOT EXISTS memory.logica_test"

    def decode(self, rows, description) -> list[tuple]:
        return [tuple(r) for r in rows]

    def session(self):
        conn = self.connect()
        cur = conn.cursor()
        runner = self
        ready = []

        class Session(_Session):
            def execute(self, statement):
                if "logica_test." in statement and not ready:
                    cur.execute(runner.setup)
                    cur.fetchall()
                    ready.append(True)
                cur.execute(statement)
                fetched = cur.fetchall()
                if cur.description is None:
                    return None
                return [d[0] for d in cur.description], runner.decode(fetched, cur.description)

            def close(self):
                conn.close()

        return Session()


class PrestoRunner(TrinoRunner):
    """PrestoDB over its REST client.

    Same protocol as Trino, but the client returns ARRAY/MAP columns as JSON
    strings; decode them so results compare equal to engines with native
    client-side arrays.
    """

    engine = "presto"

    def connect(self):
        import prestodb

        # One driver per task: the container's per-node memory (about 100MB)
        # otherwise goes to each join's buffers, 16 drivers each, before any
        # row is read — enough to refuse a plan of a few dozen joins.
        return prestodb.dbapi.connect(
            host=self.host,
            port=self.port,
            user="e2e",
            catalog="memory",
            schema="default",
            session_properties={"task_concurrency": "1"},
        )

    def decode(self, rows, description) -> list[tuple]:
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


class SparkRunner(Runner):
    """Apache Spark over its Thrift Server (HiveServer2) — an open-source
    stand-in for Databricks.

    The ``databricks`` dialect targets Spark SQL, so a vanilla Spark server runs
    the compiled SQL. It is NOT byte-identical to Databricks (no Photon / Unity
    Catalog / Delta), and a handful of Databricks SQL extensions are absent on
    OSS Spark. Production code talks to real Databricks via
    ``databricks-sql-connector`` (the ``databricks`` extra); this test stand-in
    uses ``pyhive`` over a NOSASL connection.

    Complex columns (ARRAY/STRUCT/MAP) arrive as JSON text over Thrift; decode
    them so results compare equal to engines with native client-side values.
    """

    engine = "databricks"

    def __init__(self, host: str, port: int):
        self.host = host
        self.port = port

    def session(self):
        from pyhive import hive

        from thrift.transport import TSocket, TTransport

        # A statement Spark never answers (a plan it cannot finish) blocks in
        # a socket read, which pytest-timeout's signal does not interrupt:
        # the socket gives up first, and the test fails instead of the run
        # hanging. NOSASL is a plain buffered transport.
        sock = TSocket.TSocket(self.host, self.port)
        sock.setTimeout(540_000)
        conn = hive.Connection(thrift_transport=TTransport.TBufferedTransport(sock), username="e2e")
        cur = conn.cursor()
        ready = []

        class Session(_Session):
            def execute(self, statement):
                if "logica_test." in statement and not ready:  # @Ground writes into this database
                    cur.execute("CREATE DATABASE IF NOT EXISTS logica_test")
                    ready.append(True)
                cur.execute(statement)
                # @Ground emits DDL (DROP/CREATE TABLE AS); those report a
                # schema but no fetchable result set, and pyhive crashes on
                # fetchall(). Only fetch from result-producing statements.
                if SparkRunner._produces_rows(statement) and cur.description is not None:
                    return [d[0] for d in cur.description], SparkRunner._decode(cur.fetchall(), cur.description)
                return None

            def close(self):
                conn.close()

        return Session()

    @staticmethod
    def _produces_rows(statement: str) -> bool:
        # Strip leading line comments (@Ground prefixes the final SELECT with one).
        body = "\n".join(
            line for line in statement.splitlines() if not line.lstrip().startswith("--")
        ).lstrip()
        return body[:6].upper().startswith(("SELECT", "WITH", "VALUES", "SHOW", "DESC"))

    @staticmethod
    def _decode(rows, description) -> list[tuple]:
        import json

        json_cols = [
            i
            for i, col in enumerate(description)
            if col[1] in ("ARRAY_TYPE", "STRUCT_TYPE", "MAP_TYPE")
        ]
        if not json_cols:
            return [tuple(r) for r in rows]
        decoded = []
        for row in rows:
            row = list(row)
            for i in json_cols:
                if isinstance(row[i], str):
                    row[i] = json.loads(row[i])
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
    if engine == "databricks":
        return SparkRunner(
            os.environ.get("SYNALOG_E2E_SPARK_HOST", "localhost"),
            int(os.environ.get("SYNALOG_E2E_SPARK_PORT", "10000")),
        )
    raise ValueError(f"No e2e runner for engine '{engine}'")
