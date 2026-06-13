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


def _run_sqlite(sql: str, loads) -> Result:
    conn = sqlite3.connect(":memory:")
    try:
        from logica.common import sqlite3_logica

        sqlite3_logica.ExtendConnectionWithLogicaFunctions(conn)
    except ImportError:
        pass  # best effort: most programs only need plain sqlite3

    # `search` compiles to the SQLite REGEXP operator, which stdlib sqlite3
    # leaves undefined. SQLite maps `X REGEXP Y` to `regexp(Y, X)`, so the
    # function receives (pattern, value).
    import re

    def _regexp(pattern, value):
        return value is not None and re.search(pattern, value) is not None

    conn.create_function("REGEXP", 2, _regexp)
    try:
        for table, path in loads:
            _load_sqlite(conn, table, path)
        columns: list[str] = []
        rows: list[tuple] = []
        for statement in _split_sqlite_statements(sql):
            cur = conn.execute(statement)
            if cur.description is not None:
                columns = [col[0] for col in cur.description]
                rows = cur.fetchall()
        return columns, rows
    finally:
        conn.close()


def _run_duckdb(sql: str, loads) -> Result:
    try:
        import duckdb
    except ImportError:
        raise RunnerUnavailable(
            "The duckdb engine needs the 'duckdb' package: pip install duckdb"
        ) from None

    conn = duckdb.connect(":memory:")
    try:
        conn.execute("CREATE MACRO ARRAY_CONCAT_AGG(x) AS flatten(list(x))")
        for table, path in loads:
            reader = _DUCKDB_READERS[_extension(path)]
            conn.execute(
                f"CREATE OR REPLACE TABLE {_quote(table)}"
                f" AS SELECT * FROM {reader}(?)",
                [path],
            )
        # duckdb executes multi-statement scripts and returns the last result.
        cur = conn.execute(sql)
        columns = [col[0] for col in cur.description or []]
        return columns, cur.fetchall()
    finally:
        conn.close()


def _run_psql(sql: str, dsn: str | None) -> Result:
    try:
        import psycopg
    except ImportError:
        raise RunnerUnavailable(
            "The psql engine needs the 'psycopg' package: pip install psycopg"
        ) from None

    dsn = _require_dsn("psql", dsn)
    with psycopg.connect(dsn, autocommit=True) as conn:
        with conn.cursor() as cur:
            cur.execute(
                "CREATE OR REPLACE AGGREGATE ARRAY_CONCAT_AGG(anycompatiblearray)"
                " (SFUNC = array_cat, STYPE = anycompatiblearray)"
            )
            cur.execute(sql)
            columns: list[str] = []
            rows: list[tuple] = []
            while True:
                if cur.description is not None:
                    columns = [col[0] for col in cur.description]
                    rows = cur.fetchall()
                if not cur.nextset():
                    break
            return columns, rows


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
            f"The {engine} engine needs a connection string: pass --dsn, set"
            f" SYNALOG_{engine.upper()}_DSN, or run 'synalog connect {engine} <dsn>'"
        )
    return resolved


def _reject_loads(loads, engine: str) -> None:
    if loads:
        raise RunnerUnavailable(
            f"The {engine} runner cannot load local files into the database;"
            " load them with your own tools, or use --engine duckdb/sqlite"
        )


def _dbapi_fetch(cur, sql: str) -> Result:
    """Run a single-statement script through a DBAPI cursor and fetch rows."""
    cur.execute(sql.rstrip("; \n"))
    columns = [col[0] for col in (cur.description or [])]
    return columns, cur.fetchall()


def _run_trino(sql: str, dsn: str | None, loads) -> Result:
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
    try:
        cur = conn.cursor()
        return _dbapi_fetch(cur, sql)
    finally:
        conn.close()


def _run_presto(sql: str, dsn: str | None, loads) -> Result:
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
    try:
        cur = conn.cursor()
        return _dbapi_fetch(cur, sql)
    finally:
        conn.close()


def _run_databricks(sql: str, dsn: str | None, loads) -> Result:
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
    try:
        cur = conn.cursor()
        return _dbapi_fetch(cur, sql)
    finally:
        conn.close()


def _run_bigquery(sql: str, dsn: str | None, loads) -> Result:
    _reject_loads(loads, "bigquery")
    try:
        from google.cloud import bigquery
    except ImportError:
        raise RunnerUnavailable(
            "The bigquery engine needs the 'google-cloud-bigquery' package:"
            " pip install google-cloud-bigquery"
        ) from None

    # BigQuery authenticates via Application Default Credentials; the DSN, when
    # given, only names the billing project (and optional location). It is
    # optional — ADC supplies a default project.
    project = location = None
    if resolved := _resolve_dsn("bigquery", dsn):
        if "://" in resolved:
            url = urllib.parse.urlparse(resolved)
            project = url.hostname or url.netloc or None
            location = dict(urllib.parse.parse_qsl(url.query)).get("location")
        else:
            project = resolved
    try:
        client = bigquery.Client(project=project, location=location)
        job = client.query(sql.rstrip("; \n"))
        result = job.result()
        columns = [field.name for field in result.schema]
        rows = [tuple(row.values()) for row in result]
        return columns, rows
    except Exception as e:
        if isinstance(e, RunnerUnavailable):
            raise
        raise RunnerUnavailable(f"bigquery error ({type(e).__name__}: {e})") from None


_REMOTE_RUNNERS = {
    "trino": _run_trino,
    "presto": _run_presto,
    "databricks": _run_databricks,
    "bigquery": _run_bigquery,
}


def run_sql(engine: str, sql: str, dsn: str | None = None, loads=()) -> Result:
    """Execute `sql` against `engine`, returning (column_names, rows).

    `loads` is a sequence of (table, path) pairs; each file is loaded into
    the connection as a table before the script runs.
    """
    if engine == "sqlite":
        return _run_sqlite(sql, loads)
    if engine == "duckdb":
        return _run_duckdb(sql, loads)
    if engine == "psql":
        _reject_loads(loads, "psql")
        return _run_psql(sql, dsn)
    if runner := _REMOTE_RUNNERS.get(engine):
        return runner(sql, dsn, loads)
    raise RunnerUnavailable(
        f"Engine '{engine}' has no local runner. Use the 'print' command to get"
        " the SQL and run it with your own client."
    )
