# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Introspect a database schema into the table files of a project.

`synalog introspect` connects to the project's (or a given) connection, reads
the table/column catalog across all user (non-system) schemas, and writes one
file per table into the project's `tables/` folder, the rest of the project
building on them; outside a project, it prints the declarations.

Each database table becomes one predicate mapping the physical, schema-qualified
table to a PascalCase predicate,
``SchemaTable(col1:, col2:) :- schema.table(col1:, col2:);``, ordered by its first
column (usually its key) so its rows come back in the same order on every run,
and described from the table's name until someone writes a better description.
Predicate names are qualified by schema so tables of the same name in different
schemas never clash.

The catalog comes from ``information_schema.columns`` for PostgreSQL, Trino and
Presto. BigQuery exposes it per-region as ``INFORMATION_SCHEMA.COLUMNS``.
Databricks tries ``information_schema.columns`` first (Unity Catalog) and falls
back to ``SHOW SCHEMAS`` / ``SHOW TABLES`` / ``DESCRIBE TABLE`` for catalogs
without an information schema (legacy ``hive_metastore``, plain Spark).
"""

from __future__ import annotations

import re
import urllib.parse
from pathlib import Path
from typing import NamedTuple

from .runners import RunnerUnavailable, _resolve_dsn, run_sql

# Engines whose catalog `information_schema.columns` covers directly, mapped to
# the predicate that excludes that engine's system schemas. Trino/Presto and
# Databricks expose one `information_schema` per catalog; PostgreSQL adds the
# `pg_catalog` system schema alongside it.
# Synalog's own schemas, where it stores the tables a run computes (the steps
# of a recursion, grounded predicates): never the user's tables.
_SYNALOG_SCHEMAS = ("logica_home", "logica_test")
_NOT_SYNALOG = f"table_schema NOT IN ({', '.join(repr(s) for s in _SYNALOG_SCHEMAS)})"

_INFO_SCHEMA_WHERE = {
    "psql": f"table_schema NOT IN ('information_schema', 'pg_catalog') AND {_NOT_SYNALOG}",
    "trino": f"table_schema <> 'information_schema' AND {_NOT_SYNALOG}",
    "presto": f"table_schema <> 'information_schema' AND {_NOT_SYNALOG}",
    "databricks": f"table_schema <> 'information_schema' AND {_NOT_SYNALOG}",
}

# Engines this command can introspect (everything `synalog connect` supports).
INTROSPECTABLE = (*_INFO_SCHEMA_WHERE, "bigquery")


def _info_schema_sql(where: str) -> str:
    return (
        "SELECT table_schema, table_name, column_name\n"
        "FROM information_schema.columns\n"
        f"WHERE {where}\n"
        "ORDER BY table_schema, table_name, ordinal_position"
    )


def _bigquery_sql(dsn: str | None) -> str:
    # BigQuery's COLUMNS view is region-qualified; the region comes from the
    # DSN's ?location= (default: the multi-region US), the default project.
    location = "us"
    if dsn and "://" in dsn:
        query = urllib.parse.parse_qs(urllib.parse.urlparse(dsn).query)
        location = (query.get("location") or ["us"])[0]
    return (
        "SELECT table_schema, table_name, column_name\n"
        f"FROM `region-{location.lower()}`.INFORMATION_SCHEMA.COLUMNS\n"
        f"WHERE {_NOT_SYNALOG}\n"
        "ORDER BY table_schema, table_name, ordinal_position"
    )


def _introspect_sql(engine: str, dsn: str | None) -> str:
    if engine == "bigquery":
        return _bigquery_sql(dsn)
    return _info_schema_sql(_INFO_SCHEMA_WHERE[engine])


# ---------------------------------------------------------------------------
# Reading the catalog
# ---------------------------------------------------------------------------

# Schemas that `SHOW SCHEMAS` lists but hold no user tables to introspect.
_SHOW_SYSTEM_SCHEMAS = {"information_schema", *_SYNALOG_SCHEMAS}


def _describe_columns(fetch, schema: str, table: str) -> list[str]:
    """Column names of one table via ``DESCRIBE TABLE`` (Spark / Databricks).

    DESCRIBE returns ``(col_name, data_type, comment)`` and then, for
    partitioned tables, a ``# Partition Information`` section that repeats the
    partition columns; stop at the first blank or ``#``-prefixed row so each
    column is counted once.
    """
    columns = []
    for row in fetch(f"DESCRIBE TABLE `{schema}`.`{table}`"):
        name = (row[0] or "").strip()
        if not name or name.startswith("#"):
            break
        columns.append(name)
    return columns


def _databricks_show_rows(fetch) -> list[tuple]:
    """Catalog as ``(schema, table, column)`` rows via SHOW/DESCRIBE.

    The portable path for Databricks catalogs without an information schema and
    for the open-source Spark stand-in. ``SHOW SCHEMAS`` yields the schema in its
    first column; ``SHOW TABLES IN s`` yields ``(database, tableName, ...)``.
    """
    rows = []
    for schema_row in fetch("SHOW SCHEMAS"):
        schema = schema_row[0]
        if schema in _SHOW_SYSTEM_SCHEMAS:
            continue
        for table_row in fetch(f"SHOW TABLES IN `{schema}`"):
            table = table_row[1]
            for column in _describe_columns(fetch, schema, table):
                rows.append((schema, table, column))
    return rows


def _databricks_rows(fetch) -> list[tuple]:
    # Unity Catalog has information_schema (one fast query); older catalogs and
    # plain Spark do not, so fall back to SHOW/DESCRIBE on any failure.
    try:
        return list(fetch(_info_schema_sql(_INFO_SCHEMA_WHERE["databricks"])))
    except Exception:
        return _databricks_show_rows(fetch)


def _catalog_rows(engine: str, fetch, dsn: str | None) -> list[tuple]:
    if engine == "databricks":
        return _databricks_rows(fetch)
    return list(fetch(_introspect_sql(engine, dsn)))


# ---------------------------------------------------------------------------
# Formatting catalog rows into Logica predicates
# ---------------------------------------------------------------------------

_PLAIN = re.compile(r"[a-z_][a-z0-9_]*")  # usable verbatim as a Logica field/var
_IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")  # usable as an explicit field name


def _pascal(name: str) -> str:
    parts = re.split(r"[^0-9A-Za-z]+", name)
    return "".join(p[:1].upper() + p[1:] for p in parts if p)


def table_description(table: str) -> str:
    """A table's description from its name, until someone writes a better
    one: ``public.order_items`` reads "Order items.", ``CustomerAccounts``
    "Customer accounts."."""
    name = table.split(".")[-1]
    words = re.sub(r"(?<=[a-z0-9])(?=[A-Z])", " ", name).replace("_", " ").replace("-", " ").split()
    text = " ".join(words).lower()
    return (text[:1].upper() + text[1:] + ".") if text else "A table of the database."


def _safe_var(column: str) -> str:
    var = re.sub(r"[^0-9A-Za-z]+", "_", column).strip("_").lower()
    if not var or var[0].isdigit():
        var = f"c_{var}".rstrip("_")
    return var


def _field(column: str) -> str | None:
    """Render one column as a named-argument field, or None if it cannot be.

    A plain lowercase column uses the shorthand ``col:`` form. A column that is a
    valid identifier but not lowercase (e.g. ``UserId``) maps to a safe variable,
    ``UserId: user_id`` — the parser rejects capitalized shorthand fields. Columns
    with characters that need SQL quoting have no faithful representation here and
    are skipped (the caller emits a comment).
    """
    if _PLAIN.fullmatch(column):
        return f"{column}:"
    if _IDENT.fullmatch(column):
        return f"{column}: {_safe_var(column)}"
    return None


class Table(NamedTuple):
    """One database table, as a predicate of the project."""

    name: str
    description: str
    order_by: str
    declaration: str


def tables(rows: list[tuple]) -> tuple[list[Table], list[str]]:
    """The tables of catalog rows ``(schema, table, column)``, and a note for
    each column or table that cannot be represented.

    Rows are assumed grouped by table in column order, as the introspection
    queries return them. Predicate names are ``Schema`` + ``Table`` in PascalCase,
    de-duplicated with a numeric suffix on the rare collision.
    """
    columns_of: dict[tuple[str, str], list[str]] = {}
    for schema, table, column in rows:
        columns_of.setdefault((str(schema), str(table)), []).append(str(column))

    used: dict[str, int] = {}
    found: list[Table] = []
    skipped: list[str] = []
    for (schema, table), columns in columns_of.items():
        fields, dropped = [], []
        for column in columns:
            field = _field(column)
            (fields if field else dropped).append(field or column)
        if dropped:
            skipped.append(
                f"# {schema}.{table}: skipped column(s) needing quoting: "
                + ", ".join(dropped)
            )
        if not fields:
            skipped.append(f"# {schema}.{table}: no representable columns, omitted.")
            continue
        name = _pascal(schema) + _pascal(table)
        if name in used:
            used[name] += 1
            name = f"{name}{used[name]}"
        else:
            used[name] = 1
        joined = ", ".join(fields)
        first = fields[0].split(":")[0]
        found.append(
            Table(
                name=name,
                description=table_description(table),
                order_by=f'@OrderBy({name}, "{first}");',
                declaration=f"{name}({joined}) :- {schema}.{table}({joined});",
            )
        )
    return found, skipped


def predicates(engine: str, rows: list[tuple]) -> str:
    """Format catalog rows ``(schema, table, column)`` as the declarations of
    their tables, each after a ``##`` description and its ``@OrderBy``."""
    found, skipped = tables(rows)
    lines = [
        f"# Tables — generated by `synalog introspect {engine}`"
        f" ({len(found)} tables).",
    ]
    for table in found:
        lines += ["", f"## {table.description}", table.order_by, table.declaration]
    if skipped:
        lines.append("")
        lines.extend(skipped)
    return "\n".join(lines) + "\n"


def _yaml_string(text: str) -> str:
    """``text`` as a YAML scalar: quoted when plain YAML would misread it."""
    plain = re.fullmatch(r"[A-Za-z0-9][^:#\n]*", text) and not text.endswith(" ")
    return text if plain else '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def _front_matter_block(text: str) -> str | None:
    """The front matter opening ``text``, with its ``---`` lines, if any."""
    lines = text.splitlines(keepends=True)
    if lines and lines[0].rstrip() == "---":
        for i, line in enumerate(lines[1:], 1):
            if line.rstrip() == "---":
                return "".join(lines[: i + 1])
    return None


def write_tables(folder: str | Path, found: list[Table]) -> dict[str, list[str]]:
    """Write one file per table, ``<folder>/<Name>.l``: front matter, then the
    table's ``@OrderBy`` and declaration.

    A table file that exists keeps its front matter as written — a description,
    keywords, ``locked`` written by hand — and only its declaration is
    regenerated. Returns the tables ``written``, and the table files the
    database no longer has (``gone``): kept, since the project's concepts may
    import them.
    """
    folder = Path(folder)
    folder.mkdir(parents=True, exist_ok=True)
    for table in found:
        path = folder / f"{table.name}.l"
        previous = _front_matter_block(path.read_text()) if path.exists() else None
        front = previous or (
            f"---\nname: {table.name}\ndescription: {_yaml_string(table.description)}\n---\n"
        )
        path.write_text(f"{front}{table.order_by}\n{table.declaration}\n")
    names = {table.name for table in found}
    gone = sorted(p.stem for p in folder.glob("*.l") if p.stem not in names)
    return {"written": [table.name for table in found], "gone": gone}


def introspect(engine: str, dsn: str | None = None, fetch=None) -> str:
    """Connect, read the catalog, and return the declarations of its tables."""
    return predicates(engine, catalog(engine, dsn, fetch))


def catalog(engine: str, dsn: str | None = None, fetch=None) -> list[tuple]:
    """Connect and read the catalog rows ``(schema, table, column)``.

    ``fetch`` is an optional ``sql -> rows`` executor; when omitted, queries run
    through :func:`synalog.runners.run_sql` against the resolved connection. Tests
    inject one to drive introspection against a runner of their choice.
    """
    if engine not in INTROSPECTABLE:
        raise RunnerUnavailable(
            f"'{engine}' cannot be introspected; engines with a catalog: "
            + ", ".join(INTROSPECTABLE)
        )
    if fetch is None:
        resolved = _resolve_dsn(engine, dsn)
        if not resolved and engine != "bigquery":  # bigquery falls back to ADC
            raise RunnerUnavailable(
                f"The {engine} engine needs a connection string: pass it after the"
                f" engine, set SYNALOG_{engine.upper()}_DSN, or run"
                f" 'synalog connect {engine} <dsn>'"
            )

        def fetch(sql: str):
            return run_sql(engine, sql, dsn=resolved)[1]

        dsn = resolved
    return _catalog_rows(engine, fetch, dsn)
