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

ClickHouse and MySQL run on their servers (see docker-compose.yml here).

synalog's SQL runs as a user that may read everything and write in
`synalog_home` only (`APP_USER`), as SynaLemma connects to a customer's
database: the engine itself refuses any other write. The tables a test reads
(the customer's data) are created first, by another user (`setup`).
  - PostgreSQL, MySQL, ClickHouse: the user's grants (`APP_GRANTS`).
  - Trino, Presto: file-based access control (`access-control/` here).
  - SQLite: an authorizer refusing any write outside `synalog_home`.
  - DuckDB: the data is a database attached read-only.
  - Spark has no access control: there, the statement check of `writes.py`,
    which reads every statement on every engine before it runs, is the guard.

The ``Today``/``Now`` built-in concepts no longer need a runtime table — the
compiler inlines them per dialect.
"""

from __future__ import annotations

import os
import sqlite3


from synalog.runners import run_plan as _run_plan
from synalog.runners import split_statements as _split_statements
from synalog.writes import HOME
from writes import Audited

# The user synalog's SQL runs as: it reads everything, writes in synalog_home only.
APP_USER = "synalog_app"
APP_PASSWORD = "synalog_app"

# Its grants, given by the administrator (each statement may run again).
APP_GRANTS = {
    "psql": [
        f"""DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = '{APP_USER}') THEN
              CREATE ROLE {APP_USER} LOGIN PASSWORD '{APP_PASSWORD}'; END IF;
            EXCEPTION WHEN duplicate_object OR unique_violation THEN NULL; END $$""",
        # Its schema, and only it: what an earlier run left there as another
        # user is dropped with it.
        f"""DO $$ BEGIN IF EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = '{HOME}'
              AND nspowner <> (SELECT oid FROM pg_roles WHERE rolname = '{APP_USER}')) THEN
              DROP SCHEMA {HOME} CASCADE; END IF; END $$""",
        f"CREATE SCHEMA IF NOT EXISTS {HOME} AUTHORIZATION {APP_USER}",
        "REVOKE CREATE ON SCHEMA public FROM PUBLIC",
        "REVOKE CREATE ON DATABASE synalog FROM PUBLIC",
        f"GRANT USAGE ON SCHEMA public, shop, analytics TO {APP_USER}",
        f"GRANT SELECT ON ALL TABLES IN SCHEMA public, shop, analytics TO {APP_USER}",
        f"ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO {APP_USER}",
    ],
    "mysql": [
        f"CREATE USER IF NOT EXISTS '{APP_USER}'@'%' IDENTIFIED BY '{APP_PASSWORD}'",
        f"GRANT SELECT ON synalog.* TO '{APP_USER}'@'%'",
        f"GRANT ALL ON {HOME}.* TO '{APP_USER}'@'%'",
    ],
    "clickhouse": [
        f"CREATE USER IF NOT EXISTS {APP_USER} IDENTIFIED BY '{APP_PASSWORD}'",
        f"GRANT SELECT ON synalog.* TO {APP_USER}",
        f"GRANT ALL ON {HOME}.* TO {APP_USER}",
    ],
}


class Runner:
    engine = ""

    def run(self, sql: str) -> list[tuple]:
        return self.run_plan([{"kind": "sql", "sql": sql}])

    def run_plan(self, steps: list[dict]) -> list[tuple]:
        """Run a plan as synalog's user, after its steps marked `admin`
        (the tables it reads) ran as the administrator."""
        session = self.session([s["sql"] for s in steps if s.get("admin")])
        try:
            return _run_plan([s for s in steps if not s.get("admin")], session)[1]
        finally:
            session.close()

    def setup(self, *statements: str) -> None:
        """Run `statements` as the administrator: the customer's data."""
        self.session(list(statements)).close()

    def session(self, setup=()):
        """A session of synalog's user, after `setup` ran as the administrator;
        each statement is read before it runs (`writes.Audited`)."""
        return Audited(self.open(list(setup)), self.engine)

    def open(self, setup: list[str]):
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

    # The authorizer's codes of the actions that write (sqlite3.h), and which
    # argument names the database: the third, the first for ALTER TABLE.
    WRITES = {
        sqlite3.SQLITE_CREATE_INDEX: 2, sqlite3.SQLITE_CREATE_TABLE: 2,
        sqlite3.SQLITE_CREATE_TRIGGER: 2, sqlite3.SQLITE_CREATE_VIEW: 2,
        sqlite3.SQLITE_DELETE: 2, sqlite3.SQLITE_DROP_INDEX: 2,
        sqlite3.SQLITE_DROP_TABLE: 2, sqlite3.SQLITE_DROP_TRIGGER: 2,
        sqlite3.SQLITE_DROP_VIEW: 2, sqlite3.SQLITE_INSERT: 2,
        sqlite3.SQLITE_UPDATE: 2, sqlite3.SQLITE_ALTER_TABLE: 0,
        sqlite3.SQLITE_CREATE_VTABLE: 2, sqlite3.SQLITE_DROP_VTABLE: 2,
        sqlite3.SQLITE_REINDEX: 2, sqlite3.SQLITE_ANALYZE: 2,
    }

    @staticmethod
    def home_only(action, arg1, arg2, database, trigger):
        """Refuse a write outside synalog_home (and the session's `temp`)."""
        if action == sqlite3.SQLITE_ATTACH:
            return sqlite3.SQLITE_OK if arg1 == ":memory:" else sqlite3.SQLITE_DENY
        if action == sqlite3.SQLITE_DETACH:
            return sqlite3.SQLITE_DENY
        # An older SQLite (3.37, Ubuntu 22.04's) asks, as it connects `json_each`, whether its
        # schema table may be updated; a statement may not update it (SQLite
        # refuses) unless `writable_schema` is on, which is refused here.
        if action == sqlite3.SQLITE_UPDATE and arg1 == "sqlite_master":
            return sqlite3.SQLITE_OK
        if action == sqlite3.SQLITE_PRAGMA and (arg1 or "").lower() == "writable_schema":
            return sqlite3.SQLITE_DENY
        at = SqliteRunner.WRITES.get(action)
        if at is None:
            return sqlite3.SQLITE_OK
        target = (arg1, arg2, database)[at]
        return sqlite3.SQLITE_OK if target in (HOME, "temp") else sqlite3.SQLITE_DENY

    def open(self, setup):
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
        for script in setup:
            for statement in SqliteRunner._split(script):
                conn.execute(statement)
        conn.set_authorizer(SqliteRunner.home_only)

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

    def open(self, setup):
        import tempfile

        import duckdb

        # The data is a database of its own, attached read-only, its tables
        # read by name (`search_path`): synalog writes in the session's.
        data = None
        if setup:
            data = os.path.join(tempfile.mkdtemp(prefix="synalog-e2e-"), "data.duckdb")
            with duckdb.connect(data) as admin:
                for script in setup:
                    admin.execute(script)
        conn = duckdb.connect(":memory:")
        if data:
            conn.execute(f"ATTACH '{data}' AS customer (READ_ONLY)")
            conn.execute("SET search_path = 'memory.main,customer.main'")
        conn.execute("CREATE TEMP MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))")

        class Session(_Session):
            def run(self, script):
                # duckdb executes multi-statement scripts and returns the last result.
                cur = conn.execute(script)
                if cur is None or cur.description is None:
                    return [], []
                return [d[0] for d in cur.description], cur.fetchall()

            def close(self):
                conn.close()
                if data:
                    import shutil

                    shutil.rmtree(os.path.dirname(data), ignore_errors=True)

        return Session()


class PostgresRunner(Runner):
    """PostgreSQL over psycopg3. Each session is a throwaway connection;
    synalog preambles use ``create ... if not exists`` so reruns are idempotent."""

    engine = "psql"

    def __init__(self, dsn: str, app_dsn: str):
        self.dsn = dsn
        self.app_dsn = app_dsn

    def grant(self):
        import psycopg

        # One worker at a time: the first may drop a schema left by another user.
        with psycopg.connect(self.dsn) as admin:
            admin.execute("SELECT pg_advisory_xact_lock(715)")
            for statement in APP_GRANTS["psql"]:
                admin.execute(statement)

    def open(self, setup):
        import psycopg

        _granted(self)
        if setup:
            with psycopg.connect(self.dsn, autocommit=True) as admin:
                for script in setup:
                    admin.execute(script)
        conn = psycopg.connect(self.app_dsn, autocommit=True)
        cur = conn.cursor()
        from synalog.runners import PSQL_ARRAY_CONCAT_AGG

        cur.execute(PSQL_ARRAY_CONCAT_AGG)

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

    def connect(self, user: str = APP_USER):
        import trino

        return trino.dbapi.connect(
            host=self.host, port=self.port, user=user, catalog="memory", schema="default"
        )

    # @Ground writes into this schema.
    make_home = "CREATE SCHEMA IF NOT EXISTS synalog_home.synalog_home"

    def decode(self, rows, description) -> list[tuple]:
        return [tuple(r) for r in rows]

    def open(self, setup):
        if setup:
            admin = self.connect("admin")
            try:
                for script in setup:
                    cur = admin.cursor()
                    cur.execute(script)
                    cur.fetchall()
            finally:
                admin.close()
        conn = self.connect()
        cur = conn.cursor()
        runner = self
        ready = []

        class Session(_Session):
            def execute(self, statement):
                if "synalog_home." in statement and not ready:
                    cur.execute(runner.make_home)
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

    def connect(self, user: str = APP_USER):
        import prestodb

        # One driver per task: the container's per-node memory (about 100MB)
        # otherwise goes to each join's buffers, 16 drivers each, before any
        # row is read — enough to refuse a plan of a few dozen joins.
        return prestodb.dbapi.connect(
            host=self.host,
            port=self.port,
            user=user,
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

    def open(self, setup):
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
        # No access control on Spark: the data is created in the same session.
        for script in setup:
            cur.execute(script)
        ready = []

        class Session(_Session):
            def execute(self, statement):
                if "synalog_home." in statement and not ready:  # @Ground writes into this database
                    cur.execute("CREATE DATABASE IF NOT EXISTS synalog_home")
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


class ClickHouseRunner(Runner):
    """ClickHouse over its HTTP interface (clickhouse-connect). A session is
    one server session, so the settings a script's preamble sets hold for
    its later statements."""

    engine = "clickhouse"

    def __init__(self, host: str, port: int, user: str, password: str):
        self.host = host
        self.port = port
        self.user = user
        self.password = password

    def client(self, user: str, password: str):
        import uuid

        import clickhouse_connect

        return clickhouse_connect.get_client(
            host=self.host,
            port=self.port,
            username=user,
            password=password,
            database="synalog",
            session_id=f"synalog-e2e-{uuid.uuid4()}",
            # A recursion's script is long: the server's default bounds a
            # query's text at 256 KiB.
            settings={"max_query_size": 100_000_000},
        )

    def grant(self):
        admin = self.client(self.user, self.password)
        try:
            for statement in APP_GRANTS["clickhouse"]:
                admin.command(statement)
        finally:
            admin.close()

    def open(self, setup):
        _granted(self)
        if setup:
            admin = self.client(self.user, self.password)
            try:
                for script in setup:
                    admin.command(script)
            finally:
                admin.close()
        client = self.client(APP_USER, APP_PASSWORD)

        class Session(_Session):
            def execute(self, statement):
                if not SparkRunner._produces_rows(statement):
                    client.command(statement)
                    return None
                result = client.query(statement)
                return list(result.column_names), [tuple(r) for r in result.result_rows]

            def close(self):
                client.close()

        return Session()


class MySQLRunner(Runner):
    """MySQL through synalog's own session (``synalog.runners.MySQLSession``):
    one connection per session, its JSON columns decoded."""

    engine = "mysql"

    def __init__(self, host: str, port: int, user: str, password: str):
        self.connection = {"engine": "mysql", "host": host, "port": port, "user": user,
                           "password": password, "database": "synalog"}

    def admin(self):
        import pymysql

        c = self.connection
        return pymysql.connect(host=c["host"], port=c["port"], user=c["user"], password=c["password"],
                               database=c["database"], autocommit=True)

    def grant(self):
        with self.admin() as admin, admin.cursor() as cur:
            for statement in APP_GRANTS["mysql"]:
                cur.execute(statement)

    def open(self, setup):
        from synalog.runners import MySQLSession

        _granted(self)
        if setup:
            with self.admin() as admin, admin.cursor() as cur:
                for script in setup:
                    cur.execute(script)
        return MySQLSession(self.connection | {"user": APP_USER, "password": APP_PASSWORD})


_GRANTED: set[tuple] = set()


def _granted(runner) -> None:
    """Give synalog's user its grants, once per process and server."""
    key = (runner.engine, *sorted(map(str, vars(runner).values())))
    if key not in _GRANTED:
        runner.grant()
        _GRANTED.add(key)


def make_runner(engine: str):
    """Build the runner for `engine`, reading connection info from env vars."""
    if engine == "sqlite":
        return SqliteRunner()
    if engine == "duckdb":
        return DuckDbRunner()
    if engine == "psql":
        dsn = os.environ.get(
            "SYNALOG_E2E_PSQL_DSN",
            "postgresql://synalog:synalog@localhost:{}/synalog".format(
                os.environ.get("SYNALOG_E2E_PSQL_PORT", "5433")
            ),
        )
        from urllib.parse import urlparse

        url = urlparse(dsn)
        app = url._replace(netloc=f"{APP_USER}:{APP_PASSWORD}@{url.hostname}:{url.port or 5432}")
        return PostgresRunner(dsn, app.geturl())
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
    if engine == "clickhouse":
        return ClickHouseRunner(
            os.environ.get("SYNALOG_E2E_CLICKHOUSE_HOST", "localhost"),
            int(os.environ.get("SYNALOG_E2E_CLICKHOUSE_PORT", "8123")),
            os.environ.get("SYNALOG_E2E_CLICKHOUSE_USER", "synalog"),
            os.environ.get("SYNALOG_E2E_CLICKHOUSE_PASSWORD", "synalog"),
        )
    if engine == "mysql":
        return MySQLRunner(
            os.environ.get("SYNALOG_E2E_MYSQL_HOST", "127.0.0.1"),
            int(os.environ.get("SYNALOG_E2E_MYSQL_PORT", "3307")),
            os.environ.get("SYNALOG_E2E_MYSQL_USER", "root"),
            os.environ.get("SYNALOG_E2E_MYSQL_PASSWORD", "synalog"),
        )
    raise ValueError(f"No e2e runner for engine '{engine}'")
