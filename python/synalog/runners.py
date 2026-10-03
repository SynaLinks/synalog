# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""SQL runners for the synalog CLI: execute compiled SQL against real engines.

Each runner takes a SQL script (possibly multi-statement, as produced by
``synalog.compile``) and returns ``(columns, rows)`` for the last statement
that produced a result set. Connections are in-memory and per-call, so the
``loads`` argument — a list of ``(table, path)`` pairs for csv/tsv/json/
jsonl/parquet files — is replayed on every connection before the script runs.

Local, in-memory engines (``sqlite``, ``duckdb``) build the connection from
``loads``; remote engines (``psql``, ``trino``, ``presto``, ``databricks``,
``bigquery``) connect over the network using a connection string resolved, in
order, from the ``--dsn`` flag, the ``SYNALOG_<ENGINE>_DSN`` environment
variable, then the saved-connection file (see ``synalog.config``). Remote
engines cannot ingest local ``loads`` files — load those with your own tools.

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

import csv
import json
import os
import sqlite3
import urllib.parse

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

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        self.close()


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
        self.conn.execute("CREATE MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))")
        for table, path in loads:
            reader = _DUCKDB_READERS[_extension(path)]
            self.conn.execute(
                f"CREATE OR REPLACE TABLE {_quote(table)} AS SELECT * FROM {reader}(?)",
                [path],
            )

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


class PsqlSession(Session):
    engine = "psql"

    def __init__(self, dsn: str | None, loads=()):
        _reject_loads(loads, "psql")
        # The connection string first: without one, the driver is beside the point.
        dsn = _require_dsn("psql", dsn)
        try:
            import psycopg
        except ImportError as e:
            # psycopg[binary] is a dependency of synalog; plain psycopg without the
            # system's libpq fails here with "no pq wrapper available".
            raise RunnerUnavailable(
                f"The psql engine needs psycopg with its libpq ({e}): pip install 'psycopg[binary]'"
            ) from None
        self.conn = psycopg.connect(dsn, autocommit=True)
        self.cur = self.conn.cursor()
        self.cur.execute(
            "CREATE OR REPLACE AGGREGATE ARRAY_CONCAT_AGG(anycompatiblearray)"
            " (SFUNC = array_cat, STYPE = anycompatiblearray)"
        )

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

    def close(self) -> None:
        self.conn.close()


# ---------------------------------------------------------------------------
# Remote engines (network drivers, lazily imported)
# ---------------------------------------------------------------------------


def _resolve_dsn(engine: str, dsn: str | None) -> str | None:
    """Connection string for `engine`: --dsn, then env, then saved config."""
    if dsn:
        return dsn
    if env := os.environ.get(f"SYNALOG_{engine.upper()}_DSN"):
        return env
    try:
        from .config import saved_connection
    except ImportError:
        return None
    return saved_connection(engine)


def _require_dsn(engine: str, dsn: str | None) -> str:
    resolved = _resolve_dsn(engine, dsn)
    if not resolved:
        raise RunnerUnavailable(
            f"The {engine} engine needs a connection string: give the project a"
            f" [connection] in synalog.toml, pass --dsn, set SYNALOG_{engine.upper()}_DSN, or run"
            f" 'synalog connect {engine} <dsn>'"
        )
    return resolved


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


def _trino_session(dsn: str | None, loads) -> Session:
    _reject_loads(loads, "trino")
    dsn = _require_dsn("trino", dsn)
    try:
        import trino
    except ImportError:
        raise RunnerUnavailable(
            "The trino engine needs the 'trino' package: pip install trino"
        ) from None

    url = urllib.parse.urlparse(dsn)
    query = dict(urllib.parse.parse_qsl(url.query))
    path = [p for p in url.path.split("/") if p]
    port = url.port or 8080
    auth = None
    http_scheme = query.get("http_scheme") or ("https" if port == 443 else "http")
    if url.password:
        auth = trino.auth.BasicAuthentication(url.username or "", url.password)
        http_scheme = "https"
    conn = trino.dbapi.connect(
        host=url.hostname,
        port=port,
        user=url.username or query.get("user") or "synalog",
        catalog=(path[0] if path else query.get("catalog")),
        schema=(path[1] if len(path) > 1 else query.get("schema")),
        http_scheme=http_scheme,
        auth=auth,
    )
    return DbapiSession("trino", conn)


def _presto_session(dsn: str | None, loads) -> Session:
    _reject_loads(loads, "presto")
    dsn = _require_dsn("presto", dsn)
    try:
        import prestodb
    except ImportError:
        raise RunnerUnavailable(
            "The presto engine needs the 'presto-python-client' package:"
            " pip install presto-python-client"
        ) from None

    url = urllib.parse.urlparse(dsn)
    query = dict(urllib.parse.parse_qsl(url.query))
    path = [p for p in url.path.split("/") if p]
    conn = prestodb.dbapi.connect(
        host=url.hostname,
        port=url.port or 8080,
        user=url.username or query.get("user") or "synalog",
        catalog=(path[0] if path else query.get("catalog")),
        schema=(path[1] if len(path) > 1 else query.get("schema")),
    )
    return DbapiSession("presto", conn)


def _databricks_session(dsn: str | None, loads) -> Session:
    _reject_loads(loads, "databricks")
    dsn = _require_dsn("databricks", dsn)
    try:
        from databricks import sql as databricks_sql
    except ImportError:
        raise RunnerUnavailable(
            "The databricks engine needs the 'databricks-sql-connector' package:"
            " pip install databricks-sql-connector"
        ) from None

    url = urllib.parse.urlparse(dsn)
    query = dict(urllib.parse.parse_qsl(url.query))
    http_path = query.get("http_path")
    access_token = query.get("access_token") or url.password or url.username
    if not (url.hostname and http_path and access_token):
        raise RunnerUnavailable(
            "The databricks DSN needs a host, http_path and access token, e.g."
            " databricks://<token>@<host>?http_path=/sql/1.0/warehouses/<id>"
        )
    conn = databricks_sql.connect(
        server_hostname=url.hostname,
        http_path=http_path,
        access_token=access_token,
    )
    return DbapiSession("databricks", conn)


class BigQuerySession(Session):
    """BigQuery through its client, which runs a multi-statement script as one
    job: the tables a script creates live in the dataset, so the steps of a
    plan see one another's."""

    engine = "bigquery"

    def __init__(self, dsn: str | None, loads=()):
        _reject_loads(loads, "bigquery")
        try:
            from google.cloud import bigquery
        except ImportError:
            raise RunnerUnavailable(
                "The bigquery engine needs the 'google-cloud-bigquery' package:"
                " pip install google-cloud-bigquery"
            ) from None
        # BigQuery authenticates via Application Default Credentials; the DSN,
        # when given, only names the billing project (and optional location).
        project = location = None
        if resolved := _resolve_dsn("bigquery", dsn):
            if "://" in resolved:
                url = urllib.parse.urlparse(resolved)
                project = url.hostname or url.netloc or None
                location = dict(urllib.parse.parse_qsl(url.query)).get("location")
            else:
                project = resolved
        try:
            self.client = bigquery.Client(project=project, location=location)
        except Exception as e:
            raise RunnerUnavailable(f"bigquery error ({type(e).__name__}: {e})") from None

    def run(self, script: str) -> Result:
        return self.execute(script) or ([], [])

    def execute(self, statement: str) -> Result | None:
        result = self.client.query(statement.rstrip("; \n")).result()
        if not result.schema:
            return None
        return [field.name for field in result.schema], [tuple(row.values()) for row in result]


def session(engine: str, dsn: str | None = None, loads=()) -> Session:
    """Open a session on `engine`. `loads` is a sequence of (table, path)
    pairs; each file is loaded into the session as a table (local engines)."""
    if engine == "sqlite":
        return SqliteSession(loads)
    if engine == "duckdb":
        return DuckDbSession(loads)
    if engine == "psql":
        return PsqlSession(dsn, loads)
    if engine == "trino":
        return _trino_session(dsn, loads)
    if engine == "presto":
        return _presto_session(dsn, loads)
    if engine == "databricks":
        return _databricks_session(dsn, loads)
    if engine == "bigquery":
        return BigQuerySession(dsn, loads)
    raise RunnerUnavailable(
        f"Engine '{engine}' has no local runner. Use the 'print' command to get"
        " the SQL and run it with your own client."
    )


def run_sql(engine: str, sql: str, dsn: str | None = None, loads=()) -> Result:
    """Execute `sql` against `engine`, returning (column_names, rows) of its
    last statement that produced rows.

    `loads` is a sequence of (table, path) pairs; each file is loaded into
    the connection as a table before the script runs.
    """
    with session(engine, dsn, loads) as s:
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
    """
    result: Result = ([], [])
    for step in steps:
        if step["kind"] in ("setup", "sql"):
            if _has_code(step["sql"]):
                result = s.run(step["sql"])
        else:
            check = True
            for _ in range(step["repetitions"]):
                if check:
                    try:
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
    return result
