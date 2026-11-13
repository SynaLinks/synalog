# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""SQL runners for the synalog CLI: execute compiled SQL against real engines.

Each runner takes a SQL script (possibly multi-statement, as produced by
``synalog.compile``) and returns ``(columns, rows)`` for the last statement
that produced a result set. Connections are in-memory and per-call, so the
``loads`` argument — a list of ``(table, path)`` pairs for csv/tsv/json/
jsonl/parquet files — is replayed on every connection before the script runs.

Local, in-memory engines (``sqlite``, ``duckdb``) build the connection from
``loads``; remote engines (``psql``, ``trino``, ``presto``, ``databricks``,
``bigquery``, ``clickhouse``, ``mysql``) connect over the network with the fields of the project's
``[connection]`` (``synalog.project.resolve``: ``layer.toml``, its secrets
from the environment). Remote engines cannot ingest local ``loads`` files —
load those with your own tools.

Runners reproduce the runtime environment upstream Python Logica provides on
its own connections:
  - sqlite: Logica's UDFs (ArgMin/ArgMax, ARRAY_CONCAT, IN_LIST, Split, ...)
    registered via ``logica.common.sqlite3_logica`` when the ``logica``
    package is installed; plain sqlite3 otherwise.
  - duckdb: an ``ARRAY_CONCAT_AGG`` macro (flatten + list).
  - psql:   an ``ARRAY_CONCAT_AGG`` aggregate (array_cat).

The ``Today``/``Now`` built-in concepts need no runtime setup — the compiler
inlines them per dialect, so they work on every engine (including BigQuery and
read-only remote catalogs).

Each remote driver is an optional dependency, imported lazily so the package
installs without it; a missing driver raises ``RunnerUnavailable`` with the
``pip install`` hint.
"""

from __future__ import annotations

import contextlib
import csv
import decimal
import json
import math
import os
import re
import sqlite3
import time
from collections.abc import Mapping

Result = tuple[list[str], list[tuple]]

# File formats accepted by the `loads` argument of run_sql.
LOAD_EXTENSIONS = {".csv", ".tsv", ".json", ".jsonl", ".ndjson", ".parquet"}

_DUCKDB_READERS = {
    ".csv": "read_csv",
    ".tsv": "read_csv",
    ".json": "read_json",
    ".jsonl": "read_json",
    ".ndjson": "read_json",
    ".parquet": "read_parquet",
}


class RunnerUnavailable(Exception):
    """The engine has no local runner or its driver is not installed."""


def _quote(identifier: str) -> str:
    return '"' + identifier.replace('"', '""') + '"'


def _extension(path: str) -> str:
    ext = os.path.splitext(path)[1].lower()
    if ext not in LOAD_EXTENSIONS:
        raise ValueError(
            f"cannot load '{path}': supported formats are "
            + ", ".join(sorted(LOAD_EXTENSIONS))
        )
    return ext


def _coerce_csv_value(text: str):
    if text == "":
        return None
    for cast in (int, float):
        try:
            return cast(text)
        except ValueError:
            pass
    return text


def _scalar(value):
    return json.dumps(value) if isinstance(value, (dict, list)) else value


def _file_records(path: str) -> Result:
    """Read a data file into (columns, rows) for engines without file readers."""
    ext = _extension(path)
    if ext in (".csv", ".tsv"):
        with open(path, newline="", encoding="utf-8") as f:
            reader = csv.reader(f, delimiter="\t" if ext == ".tsv" else ",")
            header = next(reader, None)
            if not header:
                raise ValueError(f"cannot load '{path}': no header row")
            width = len(header)
            rows = [
                tuple(([_coerce_csv_value(v) for v in row] + [None] * width)[:width])
                for row in reader
            ]
            return header, rows
    if ext in (".json", ".jsonl", ".ndjson"):
        with open(path, encoding="utf-8") as f:
            if ext == ".json":
                records = json.load(f)
            else:
                records = [json.loads(line) for line in f if line.strip()]
        if not isinstance(records, list) or not all(
            isinstance(r, dict) for r in records
        ):
            raise ValueError(f"cannot load '{path}': expected an array of JSON objects")
        columns: dict[str, None] = {}
        for record in records:
            for key in record:
                columns.setdefault(key, None)
        if not columns:
            raise ValueError(f"cannot load '{path}': no records")
        names = list(columns)
        return names, [tuple(_scalar(r.get(c)) for c in names) for r in records]
    raise RunnerUnavailable(
        f"cannot load '{path}' with this engine; parquet needs the duckdb engine"
    )


def _load_sqlite(conn: sqlite3.Connection, table: str, path: str) -> None:
    columns, rows = _file_records(path)
    column_list = ", ".join(_quote(c) for c in columns)
    placeholders = ", ".join("?" * len(columns))
    conn.execute(f"DROP TABLE IF EXISTS {_quote(table)}")
    conn.execute(f"CREATE TABLE {_quote(table)} ({column_list})")
    conn.executemany(f"INSERT INTO {_quote(table)} VALUES ({placeholders})", rows)


def _split_sqlite_statements(sql: str) -> list[str]:
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


def split_statements(sql: str) -> list[str]:
    """The statements of a script: split on semicolons outside quotes
    ('...', "...", `...`), dollar-quoted blocks ($$...$$) and comments."""
    statements, current, i, n = [], [], 0, len(sql)
    while i < n:
        ch = sql[i]
        if ch in "'\"`":
            j = i + 1
            while j < n:
                if sql[j] == ch:
                    if j + 1 < n and sql[j + 1] == ch:  # an escaped quote
                        j += 2
                        continue
                    break
                j += 1
            current.append(sql[i : j + 1])
            i = j + 1
        elif sql.startswith("$$", i):
            j = sql.find("$$", i + 2)
            j = n if j < 0 else j + 2
            current.append(sql[i:j])
            i = j
        elif sql.startswith("--", i):
            j = sql.find("\n", i)
            j = n if j < 0 else j + 1
            current.append(sql[i:j])
            i = j
        elif ch == ";":
            statement = "".join(current).strip()
            if _has_code(statement):
                statements.append(statement)
            current = []
            i += 1
        else:
            current.append(ch)
            i += 1
    tail = "".join(current).strip()
    if _has_code(tail):
        statements.append(tail)
    return statements


def _has_code(statement: str) -> bool:
    """True if a statement holds more than comments."""
    return any(line.strip() and not line.strip().startswith("--") for line in statement.splitlines())


class Session:
    """A connection to an engine, kept open across the statements of a plan.

    ``run(script)`` runs every statement of a script and returns the
    ``(columns, rows)`` of the last one that produced rows.
    """

    engine = ""

    def run(self, script: str) -> Result:
        columns: list[str] = []
        rows: list[tuple] = []
        for statement in split_statements(script):
            result = self.execute(statement)
            if result is not None:
                columns, rows = result
        return columns, rows

    def execute(self, statement: str) -> Result | None:
        """Run one statement; its ``(columns, rows)`` if it returns rows."""
        raise NotImplementedError

    def close(self) -> None:
        pass

    def snapshot(self):
        """A context in which the statements of a plan read one state of the
        database (a transaction, on an engine that has them)."""
        return contextlib.nullcontext()

    def savepoint(self):
        """A context whose failure leaves the snapshot usable."""
        return contextlib.nullcontext()

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        self.close()


def _refused(name: str):
    def refuse(*_args):
        raise sqlite3.ProgrammingError(f"{name} is not available")
    return refuse


def number_text(value):
    """The text of a number, the same on every engine (`ToString`): a whole
    number below 10^18 with all its digits; any other below 10^38 as its
    shortest text (the one that reads back as the same double) shows it,
    rounded half away from zero to 15 significant digits but at most 15
    decimals, in plain decimal, without trailing zeros; from 10^38 as SQLite
    writes it. The compiled SQL of the other engines follows the same rule."""
    if value is None:
        return None
    if isinstance(value, int):
        return str(value)
    a = abs(value)
    if math.isnan(value) or math.isinf(value) or a >= 1e38:
        text = "%.15g" % value
        mantissa, _, exponent = text.partition("e")
        if exponent and "." not in mantissa:
            text = mantissa + ".0e" + exponent
        return text
    if a < 5e-16:
        return "0"
    if value == int(value) and a < 1e18:
        return str(int(value))
    exact = decimal.Decimal(repr(value))
    places = 15 if a < 1 else 15 - len(str(int(abs(exact))))
    rounded = exact.quantize(decimal.Decimal(1).scaleb(-places), rounding=decimal.ROUND_HALF_UP)
    text = format(rounded, "f")
    return text.rstrip("0").rstrip(".") if "." in text else text


def sqlite_semantics(conn: sqlite3.Connection) -> None:
    """Make SQLite's string functions behave as on the other engines: UPPER and
    LOWER convert every letter, not only ASCII ones (`Upper("café")`), LIKE
    tells upper from lower case, and Split of a null is null."""
    conn.create_function("UPPER", 1, lambda s: s.upper() if isinstance(s, str) else s, deterministic=True)
    conn.create_function("LOWER", 1, lambda s: s.lower() if isinstance(s, str) else s, deterministic=True)
    conn.execute("PRAGMA case_sensitive_like = ON")
    # The text of a number: SQLite has no exact decimals to round it with.
    conn.create_function("SYNALOG_NUMBER_TEXT", 1, number_text, deterministic=True)
    # Logica's Split fails on a null; a null splits to null.
    conn.create_function(
        "Split", 2,
        lambda text, sep: None if text is None or sep is None else json.dumps(text.split(sep)),
        deterministic=True,
    )
    # SQLite has no regular expressions of its own: RegexpReplace replaces
    # every match and RegexpExtract gives the first, null without one, as
    # on the other engines.
    conn.create_function(
        "REGEXP_REPLACE", 3,
        lambda text, pattern, by: None if None in (text, pattern, by) else re.sub(pattern, by, text),
        deterministic=True,
    )
    conn.create_function(
        "REGEXP_EXTRACT", 2,
        lambda text, pattern: None if None in (text, pattern) else (lambda m: m.group(0) if m else None)(re.search(pattern, text)),
        deterministic=True,
    )
    # Logica's math functions fail on a null; the math of a null is null.
    for name, arity, function in [
        ("SQRT", 1, lambda x: float(x) ** 0.5), ("POW", 2, lambda x, p: float(x) ** p),
        ("Exp", 1, math.exp), ("Log", 1, math.log), ("Sin", 1, math.sin), ("Cos", 1, math.cos),
        ("Asin", 1, math.asin), ("Acos", 1, math.acos), ("Floor", 1, math.floor),
    ]:
        conn.create_function(
            name, arity,
            lambda *args, f=function: None if None in args else f(*args),
            deterministic=True,
        )
    # A program reaches no file, process or service: Logica's functions that
    # do are not on the connection.
    for name, arity in [("ReadFile", 1), ("WriteFile", 2), ("PrintToConsole", 1),
                        ("Intelligence", 1), ("RunClingo", 1), ("RunClingoFile", 1)]:
        conn.create_function(name, arity, _refused(name))


class SqliteSession(Session):
    engine = "sqlite"

    def __init__(self, loads=()):
        self.conn = sqlite3.connect(":memory:")
        try:
            from logica.common import sqlite3_logica

            sqlite3_logica.ExtendConnectionWithLogicaFunctions(self.conn)
        except ImportError:
            pass  # best effort: most programs only need plain sqlite3

        # `search` compiles to the SQLite REGEXP operator, which stdlib sqlite3
        # leaves undefined. SQLite maps `X REGEXP Y` to `regexp(Y, X)`, so the
        # function receives (pattern, value).
        import re

        def _regexp(pattern, value):
            return value is not None and re.search(pattern, value) is not None

        self.conn.create_function("REGEXP", 2, _regexp)
        sqlite_semantics(self.conn)
        for table, path in loads:
            _load_sqlite(self.conn, table, path)

    def run(self, script: str) -> Result:
        # sqlite's own tokenizer knows its statements best.
        columns: list[str] = []
        rows: list[tuple] = []
        for statement in _split_sqlite_statements(script):
            result = self.execute(statement)
            if result is not None:
                columns, rows = result
        return columns, rows

    def execute(self, statement: str) -> Result | None:
        cur = self.conn.execute(statement)
        if cur.description is None:
            return None
        return [col[0] for col in cur.description], cur.fetchall()

    def close(self) -> None:
        self.conn.close()


class DuckDbSession(Session):
    engine = "duckdb"

    def __init__(self, loads=()):
        try:
            import duckdb
        except ImportError:
            raise RunnerUnavailable(
                "The duckdb engine needs the 'duckdb' package: pip install duckdb"
            ) from None
        self.conn = duckdb.connect(":memory:")
        # Temporary: the session's own, never stored in the database.
        self.conn.execute("CREATE TEMP MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))")
        for table, path in loads:
            reader = _DUCKDB_READERS[_extension(path)]
            self.conn.execute(
                f"CREATE OR REPLACE TABLE {_quote(table)} AS SELECT * FROM {reader}(?)",
                [path],
            )
        # The files to load are loaded: from here a program reads only tables.
        # DuckDB otherwise opens the file a table name designates (`secret.csv`,
        # `"secret"."parquet"`), installs the extension that reads it, or takes
        # the Python variable of that name.
        for setting in (
            "python_enable_replacements = false",
            "autoinstall_known_extensions = false",
            "autoload_known_extensions = false",
            "enable_external_access = false",
            "lock_configuration = true",
        ):
            self.conn.execute(f"SET {setting}")

    def run(self, script: str) -> Result:
        # duckdb executes multi-statement scripts and returns the last result
        # (no cursor at all for a script of comments).
        cur = self.conn.execute(script)
        if cur is None or cur.description is None:
            return [], []
        return [col[0] for col in cur.description], cur.fetchall()

    def execute(self, statement: str) -> Result | None:
        cur = self.conn.execute(statement)
        if cur is None or cur.description is None:
            return None
        return [col[0] for col in cur.description], cur.fetchall()

    def close(self) -> None:
        self.conn.close()



# `ARRAY_CONCAT_AGG` for `++=`, created once per database, in synalog's schema
# (`synalog_home`), as everything synalog creates. Two sessions replacing it at
# once collide ("tuple concurrently updated"), so it is created only when
# missing, and one created meanwhile by another session is as good. A session
# that may not create it (read-only) runs the queries without `++=`.
PSQL_ARRAY_CONCAT_AGG = """DO $$ BEGIN
  -- Created only where missing: `IF NOT EXISTS` needs the right to create one.
  IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'synalog_home') THEN
    CREATE SCHEMA synalog_home;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_proc WHERE proname = 'array_concat_agg'
                 AND pronamespace = 'synalog_home'::regnamespace) THEN
    CREATE AGGREGATE synalog_home.ARRAY_CONCAT_AGG(anycompatiblearray) (SFUNC = array_cat, STYPE = anycompatiblearray);
  END IF;
EXCEPTION WHEN duplicate_function OR unique_violation
  OR read_only_sql_transaction OR insufficient_privilege THEN NULL;
END $$"""

class PsqlSession(Session):
    engine = "psql"

    def __init__(self, connection: Mapping | None, loads=()):
        _reject_loads(loads, "psql")
        # The connection first: without one, the driver is beside the point.
        c = _require_connection("psql", connection)
        try:
            import psycopg
        except ImportError as e:
            # psycopg[binary] is a dependency of synalog; plain psycopg without the
            # system's libpq fails here with "no pq wrapper available".
            raise RunnerUnavailable(
                f"The psql engine needs psycopg with its libpq ({e}): pip install 'psycopg[binary]'"
            ) from None
        self.conn = psycopg.connect(
            host=c["host"],
            port=c.get("port", 5432),
            dbname=c["database"],
            user=c["user"],
            password=c.get("password"),
            sslmode=c.get("sslmode", "prefer"),
            options=f"-csearch_path={c['schema']}" if c.get("schema") else None,
            autocommit=True,
        )
        self.cur = self.conn.cursor()
        self.cur.execute(PSQL_ARRAY_CONCAT_AGG)
        # A plan's statements read one snapshot: a source changed between two
        # of them is not read in both of its versions.
        self.conn.isolation_level = psycopg.IsolationLevel.REPEATABLE_READ

    def run(self, script: str) -> Result:
        # PostgreSQL runs a whole script in one call; keep the last result set.
        self.cur.execute(script)
        columns: list[str] = []
        rows: list[tuple] = []
        while True:
            if self.cur.description is not None:
                columns = [col[0] for col in self.cur.description]
                rows = self.cur.fetchall()
            if not self.cur.nextset():
                break
        return columns, rows

    def execute(self, statement: str) -> Result | None:
        columns, rows = self.run(statement)
        return (columns, rows) if columns else None

    def snapshot(self):
        return self.conn.transaction()

    def savepoint(self):
        # Within the snapshot's transaction, a nested one is a savepoint.
        return self.conn.transaction() if self.conn.info.transaction_status else contextlib.nullcontext()

    def close(self) -> None:
        self.conn.close()


# ---------------------------------------------------------------------------
# Remote engines (network drivers, lazily imported)
# ---------------------------------------------------------------------------


def _require_connection(engine: str, connection: Mapping | None) -> Mapping:
    """The project's connection to ``engine``, or what to do without one."""
    if not connection or connection.get("engine", engine) != engine:
        raise RunnerUnavailable(
            f"The {engine} engine needs the project's connection: run"
            f" 'synalog connect {engine} key=value ...' in the project's folder"
            " (it writes layer.toml, the secrets in .env)"
        )
    return connection


def _reject_loads(loads, engine: str) -> None:
    if loads:
        raise RunnerUnavailable(
            f"The {engine} runner cannot load local files into the database;"
            " load them with your own tools, or use --engine duckdb/sqlite"
        )


class DbapiSession(Session):
    """A DB-API connection whose client takes one statement per call."""

    def __init__(self, engine: str, conn):
        self.engine = engine
        self.conn = conn
        self.cur = conn.cursor()

    def execute(self, statement: str) -> Result | None:
        self.cur.execute(statement)
        if self.cur.description is None:
            return None
        return [col[0] for col in self.cur.description], self.cur.fetchall()

    def close(self) -> None:
        self.conn.close()


def _trino_session(connection: Mapping | None, loads) -> Session:
    _reject_loads(loads, "trino")
    c = _require_connection("trino", connection)
    try:
        import trino
    except ImportError:
        raise RunnerUnavailable(
            "The trino engine needs the 'trino' package: pip install trino"
        ) from None

    auth = None
    if c.get("auth") == "password":
        auth = trino.auth.BasicAuthentication(c["user"], c.get("password", ""))
    elif c.get("auth") == "jwt":
        auth = trino.auth.JWTAuthentication(c.get("password", ""))
    conn = trino.dbapi.connect(
        host=c["host"],
        port=int(c.get("port", 8080)),
        user=c["user"],
        catalog=c.get("catalog"),
        schema=c.get("schema"),
        # Credentials only travel over https.
        http_scheme="https" if auth else c.get("scheme", "http"),
        auth=auth,
    )
    return DbapiSession("trino", conn)


def _presto_session(connection: Mapping | None, loads) -> Session:
    _reject_loads(loads, "presto")
    c = _require_connection("presto", connection)
    try:
        import prestodb
    except ImportError:
        raise RunnerUnavailable(
            "The presto engine needs the 'presto-python-client' package:"
            " pip install presto-python-client"
        ) from None

    auth = None
    if c.get("auth") == "password":
        auth = prestodb.auth.BasicAuthentication(c["user"], c.get("password", ""))
    conn = prestodb.dbapi.connect(
        host=c["host"],
        port=int(c.get("port", 8080)),
        user=c["user"],
        catalog=c.get("catalog"),
        schema=c.get("schema"),
        http_scheme="https" if auth else c.get("scheme", "http"),
        auth=auth,
    )
    return DbapiSession("presto", conn)


def _databricks_session(connection: Mapping | None, loads) -> Session:
    _reject_loads(loads, "databricks")
    c = _require_connection("databricks", connection)
    try:
        from databricks import sql as databricks_sql
    except ImportError:
        raise RunnerUnavailable(
            "The databricks engine needs the 'databricks-sql-connector' package:"
            " pip install databricks-sql-connector"
        ) from None

    conn = databricks_sql.connect(
        server_hostname=c["server_hostname"],
        http_path=c["http_path"],
        access_token=c["access_token"],
        catalog=c.get("catalog"),
        schema=c.get("schema"),
    )
    return DbapiSession("databricks", conn)


class ClickHouseSession(Session):
    """ClickHouse over its HTTP interface (clickhouse-connect), in one server
    session: the settings a script's preamble sets hold for its later
    statements."""

    engine = "clickhouse"

    def __init__(self, connection: Mapping | None, loads=()):
        _reject_loads(loads, "clickhouse")
        c = _require_connection("clickhouse", connection)
        try:
            import clickhouse_connect
        except ImportError:
            raise RunnerUnavailable(
                "The clickhouse engine needs the 'clickhouse-connect' package:"
                " pip install clickhouse-connect"
            ) from None
        import uuid

        secure = c.get("scheme", "http") == "https"
        self.client = clickhouse_connect.get_client(
            host=c["host"],
            port=int(c.get("port", 8443 if secure else 8123)),
            username=c.get("user", "default"),
            password=c.get("password", ""),
            database=c.get("database") or "default",
            secure=secure,
            session_id=f"synalog-{uuid.uuid4()}",
        )

    def execute(self, statement: str) -> Result | None:
        if not _returns_rows(statement):
            self.client.command(statement)
            return None
        result = self.client.query(statement)
        return list(result.column_names), [tuple(row) for row in result.result_rows]

    def close(self) -> None:
        self.client.close()


def _returns_rows(statement: str) -> bool:
    """Whether a statement is a query: its first word, past comments."""
    body = "\n".join(line for line in statement.splitlines() if not line.lstrip().startswith("--")).lstrip()
    return body[:8].upper().startswith(("SELECT", "WITH", "VALUES", "SHOW", "DESC", "EXPLAIN", "("))


class MySQLSession(DbapiSession):
    """MySQL through PyMySQL, in one connection: the session settings a
    script's preamble sets (its SQL mode) hold for its later statements. A
    list or a record is JSON here, read back as Python values."""

    def __init__(self, connection: Mapping | None, loads=()):
        _reject_loads(loads, "mysql")
        c = _require_connection("mysql", connection)
        try:
            import pymysql
        except ImportError:
            raise RunnerUnavailable(
                "The mysql engine needs the 'pymysql' package: pip install pymysql"
            ) from None
        conn = pymysql.connect(
            host=c["host"],
            port=int(c.get("port", 3306)),
            user=c["user"],
            password=c.get("password", ""),
            database=c["database"],
            autocommit=True,
            # As the script's preamble: a step of a plan reads the same SQL.
            init_command=(
                "SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES',"
                " optimizer_switch = 'derived_condition_pushdown=off'"
            ),
            charset="utf8mb4",
            collation="utf8mb4_0900_bin",
        )
        super().__init__("mysql", conn)

    def execute(self, statement: str) -> Result | None:
        result = super().execute(statement)
        if result is None:
            return None
        return result[0], decode_mysql_json(self.cur.description, result[1])


def decode_mysql_json(description, rows) -> list[tuple]:
    """`rows` with each value of a JSON column (a list, a record) decoded."""
    json_type = 245  # pymysql.constants.FIELD_TYPE.JSON
    json_cols = [i for i, col in enumerate(description) if col[1] == json_type]
    if not json_cols:
        return [tuple(r) for r in rows]
    decoded = []
    for row in rows:
        row = list(row)
        for i in json_cols:
            if isinstance(row[i], (str, bytes)):
                row[i] = json.loads(row[i])
        decoded.append(tuple(row))
    return decoded


class BigQuerySession(Session):
    """BigQuery through its client, which runs a multi-statement script as one
    job: the tables a script creates live in the dataset, so the steps of a
    plan see one another's."""

    engine = "bigquery"

    def __init__(self, connection: Mapping | None, loads=()):
        _reject_loads(loads, "bigquery")
        c = _require_connection("bigquery", connection)
        try:
            from google.cloud import bigquery
        except ImportError:
            raise RunnerUnavailable(
                "The bigquery engine needs the 'google-cloud-bigquery' package:"
                " pip install google-cloud-bigquery"
            ) from None
        # The key file is GOOGLE_APPLICATION_CREDENTIALS, which the client
        # reads itself; the connection names the project, dataset and location.
        project, location = c["project"], c.get("location")
        default_dataset = f"{project}.{c['dataset']}" if c.get("dataset") else None
        try:
            self.client = bigquery.Client(
                project=project,
                location=location,
                default_query_job_config=(
                    bigquery.QueryJobConfig(default_dataset=default_dataset) if default_dataset else None
                ),
            )
        except Exception as e:
            raise RunnerUnavailable(f"bigquery error ({type(e).__name__}: {e})") from None

    def run(self, script: str) -> Result:
        return self.execute(script) or ([], [])

    def execute(self, statement: str) -> Result | None:
        result = self.client.query(statement.rstrip("; \n")).result()
        if not result.schema:
            return None
        return [field.name for field in result.schema], [tuple(row.values()) for row in result]


def session(engine: str, connection: Mapping | None = None, loads=()) -> Session:
    """Open a session on `engine`. `connection` is the project's
    (``synalog.project.resolve``), which a remote engine needs; `loads` is a
    sequence of (table, path) pairs, each file loaded as a table (local
    engines)."""
    if engine == "sqlite":
        return SqliteSession(loads)
    if engine == "duckdb":
        return DuckDbSession(loads)
    if engine == "psql":
        return PsqlSession(connection, loads)
    if engine == "trino":
        return _trino_session(connection, loads)
    if engine == "presto":
        return _presto_session(connection, loads)
    if engine == "databricks":
        return _databricks_session(connection, loads)
    if engine == "bigquery":
        return BigQuerySession(connection, loads)
    if engine == "clickhouse":
        return ClickHouseSession(connection, loads)
    if engine == "mysql":
        return MySQLSession(connection, loads)
    raise RunnerUnavailable(
        f"Engine '{engine}' has no local runner. Use the 'print' command to get"
        " the SQL and run it with your own client."
    )


def run_sql(engine: str, sql: str, connection: Mapping | None = None, loads=()) -> Result:
    """Execute `sql` against `engine`, returning (column_names, rows) of its
    last statement that produced rows.

    `loads` is a sequence of (table, path) pairs; each file is loaded into
    the connection as a table before the script runs.
    """
    with session(engine, connection, loads) as s:
        return s.run(sql)


#: Past this many repetitions, a loop is not run without its convergence check.
UNROLLED_REPETITIONS = 1000


def run_plan(steps: list[dict], s: Session) -> Result:
    """Run the steps of a plan (``synalog.plan``) in a session; the rows of the
    last step.

    A loop runs its body again until its ``changed`` query returns 0 — the
    recursion has converged — or its repetitions are spent. When an engine
    cannot answer that query (a column type it cannot compare), a loop of a
    bounded depth runs every repetition instead: slower, the same rows; one
    that recurses until nothing changes (``-1``) cannot, and raises the
    engine's error.

    The steps read one state of the database (``Session.snapshot``): a
    source changed while the plan runs is read in one version only.
    """
    sweep_stale_tables(steps, s, getattr(s, "engine", ""))
    # A duck-typed session of the caller's has no snapshot: its statements
    # run as they come.
    with getattr(s, "snapshot", contextlib.nullcontext)():
        return _run_steps(steps, s)


def _run_steps(steps: list[dict], s: Session) -> Result:
    result: Result = ([], [])
    try:
        for step in steps:
            if step["kind"] in ("setup", "sql"):
                if _has_code(step["sql"]):
                    result = s.run(step["sql"])
            else:
                check = True
                for _ in range(step["repetitions"]):
                    if check:
                        try:
                            with getattr(s, "savepoint", contextlib.nullcontext)():
                                changed = s.run(step["changed"])[1]
                        except Exception:  # noqa: BLE001 - see the docstring
                            if step["repetitions"] > UNROLLED_REPETITIONS:
                                raise
                            check = False
                        else:
                            if changed and int(changed[0][0] or 0) == 0:
                                break
                    for statement in step["body"]:
                        s.run(statement)
    finally:
        _drop_working_tables(steps, s)
    return result


# The tables a plan computes into synalog's own schemas (temporary tables on
# PostgreSQL; on Trino and Presto, `synalog_home` is in a catalog of the same
# name): the steps of a recursion, grounded predicates.
_WORKING_TABLE = re.compile(r"CREATE TABLE ((?:synalog_home\.)?(?:synalog_home|pg_temp)\.\w+)", re.IGNORECASE)


# A table of a run, in a schema every session shares: its name ends with the
# run's tag, `_r`, the time the run started (Unix seconds, 7 digits in base
# 36) and 6 more digits (`run_tag` in src/python.rs).
_TAGGED_TABLE = re.compile(r"^(?:\w+\.)*(\w+)_r([0-9a-z]{7})[0-9a-z]{6}$", re.IGNORECASE)

# A run's tables are dropped when it ends; those of a run killed before its
# end are dropped by a later run once they are this old (no run lasts a day).
STALE_AFTER_SECONDS = 24 * 3600

# The tables of a schema, by engine: their name is the first column (Spark
# and Databricks list the schema first: `namespace`/`database`, `tableName`).
_LIST_TABLES = {
    "trino": ("SHOW TABLES FROM {schema}", 0),
    "presto": ("SHOW TABLES FROM {schema}", 0),
    "databricks": ("SHOW TABLES IN {schema}", 1),
    "bigquery": ("SELECT table_name FROM {schema}.INFORMATION_SCHEMA.TABLES", 0),
    "clickhouse": ("SHOW TABLES FROM {schema}", 0),
    "mysql": ("SHOW TABLES FROM {schema}", 0),
}


def sweep_stale_tables(steps: list[dict], s: Session, engine: str, now: float | None = None) -> list[str]:
    """Drop the tables killed runs left in the schemas this plan writes its
    tables in (a grounded table that stays included, PostgreSQL's temporary
    ones not), older than ``STALE_AFTER_SECONDS``; the tables dropped.

    A run drops its own tables when it ends (``_drop_working_tables``); a run
    killed first cannot. Best effort: a table it cannot list or drop stays,
    and the plan runs regardless."""
    if engine not in _LIST_TABLES:
        return []
    texts = [t for step in steps for t in _texts(step)]
    schemas = {
        t.rsplit(".", 1)[0] for text in texts for t in _WORKING_TABLE.findall(text) if not t.lower().startswith("pg_temp.")
    }
    query, column = _LIST_TABLES[engine]
    deadline = (time.time() if now is None else now) - STALE_AFTER_SECONDS
    dropped = []
    for schema in sorted(schemas):
        try:
            names = [row[column] for row in s.run(query.format(schema=schema))[1]]
        except Exception:  # noqa: BLE001 - the schema may not exist yet
            continue
        for name in names:
            m = _TAGGED_TABLE.match(str(name))
            if m and int(m.group(2), 36) < deadline:
                try:
                    s.run(f"DROP TABLE IF EXISTS {schema}.{name}")
                    dropped.append(f"{schema}.{name}")
                except Exception:  # noqa: BLE001 - best effort
                    pass
    return dropped


def _texts(step: dict) -> list[str]:
    """The SQL of a step: its statements, a loop's body."""
    return [step.get("sql", ""), *step.get("body", [])]


def _drop_working_tables(steps: list[dict], s: Session) -> None:
    """Drop the tables the run computed with in synalog's schemas, so a run
    leaves nothing behind (on Presto's memory connector they filled the
    heap): its own, named with its tag or PostgreSQL's temporary ones. A
    table of the program's own `@Ground`, named after its predicate, stays."""
    texts = [t for step in steps for t in _texts(step)]
    for table in dict.fromkeys(t for text in texts for t in _WORKING_TABLE.findall(text)):
        if not (_TAGGED_TABLE.match(table) or table.lower().startswith("pg_temp.")):
            continue
        try:
            s.run(f"DROP TABLE IF EXISTS {table}")
        except Exception:  # noqa: BLE001 - best effort: the rows are already read
            pass
