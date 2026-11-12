"""Which statements write outside synalog's schema.

synalog writes in `synalog_home` only, on every engine: its tables, the types,
sequence and aggregate its sessions need, and the schema itself (a plan's
temporary tables on PostgreSQL, in `pg_temp`, are the session's). On Trino and
Presto the schema is in a catalog of the same name, `synalog_home.synalog_home`:
there, `synalog_home.t` is a schema of the customer's catalog, and outside.

`writes_outside_home` reads a script for its writes, so that a runner can
refuse to send one that writes anywhere else: synalog's test suite checks
everything it compiles with it, and runs every statement through it.
"""

from __future__ import annotations

import re

HOME = "synalog_home"
_IN_CATALOG = ("trino", "presto")


def home(engine: str) -> str:
    """Where synalog's tables are on `engine`: its schema, in a catalog of the
    same name on Trino and Presto."""
    return f"{HOME}.{HOME}" if engine in _IN_CATALOG else HOME


# String literals and comments: a keyword inside one is no statement. A
# backslash escapes in a literal on Spark (Databricks), BigQuery and
# ClickHouse only; double quotes make a string on Spark and BigQuery, a name
# elsewhere.
_BACKSLASH_ESCAPES = ("databricks", "bigquery", "clickhouse")
_DOUBLE_QUOTED_STRINGS = ("databricks", "bigquery")
_COMMENTS = r"--[^\n]*|/\*.*?\*/"


def _literals(engine: str) -> re.Pattern:
    single = r"'(?:[^'\\]|''|\\.)*'" if engine in _BACKSLASH_ESCAPES else r"'(?:[^']|'')*'"
    strings = [single, r'"(?:[^"\\]|""|\\.)*"'] if engine in _DOUBLE_QUOTED_STRINGS else [single]
    return re.compile("|".join(strings + [_COMMENTS]), re.DOTALL)


# A write and its target. A PL/pgSQL block's statements count too.
_WRITE = re.compile(
    r"""(?ix)\b(
        CREATE\s+(?:OR\s+REPLACE\s+)?(?:TEMP(?:ORARY)?\s+)?
            (?:TABLE|VIEW|MATERIALIZED\s+VIEW|SCHEMA|DATABASE|TYPE|FUNCTION|MACRO|INDEX|SEQUENCE|AGGREGATE|PROCEDURE|TRIGGER)
            (?:\s+IF\s+NOT\s+EXISTS)?
      | DROP\s+(?:TABLE|VIEW|MATERIALIZED\s+VIEW|SCHEMA|DATABASE|TYPE|FUNCTION|MACRO|INDEX|SEQUENCE|AGGREGATE|PROCEDURE|TRIGGER)
            (?:\s+IF\s+EXISTS)?
      | INSERT\s+(?:OVERWRITE|INTO)(?:\s+TABLE)?
      | UPDATE | DELETE\s+FROM | ALTER\s+\w+ | TRUNCATE(?:\s+TABLE)? | MERGE\s+INTO
      | REPLACE\s+INTO | RENAME\s+TABLE | GRANT | REVOKE | COPY | DETACH
    )\s+([`"\w.$]+)""",
)
_ATTACH = re.compile(r"(?i)\bATTACH\s+(?:DATABASE\s+)?'#(\d+)'\s+AS\s+([`\"\w]+)")


def writes_outside_home(sql: str, engine: str) -> list[str]:
    """The writes of `sql` whose target is not in `synalog_home` (or a
    session's own temporary schema), as `VERB target`. On Trino and Presto a
    table's name holds its catalog, else it is in the customer's."""
    literals: list[str] = []

    def hide(match: re.Match) -> str:
        if match.group(0).startswith(("--", "/*")):
            return " "
        literals.append(match.group(0))
        return f"'#{len(literals) - 1}'"

    clean = _literals(engine).sub(hide, sql)
    outside = []
    for verb, target in _WRITE.findall(clean):
        verb = re.sub(r"\s+", " ", verb.upper())
        name = target.strip('`"').lower()
        schema_itself = verb.startswith(("CREATE SCHEMA", "CREATE DATABASE"))
        if (name == home(engine) if schema_itself else name.startswith((home(engine) + ".", "pg_temp."))):
            continue
        outside.append(f"{verb} {target}")
    for index, name in _ATTACH.findall(clean):
        path = literals[int(index)]
        # SQLite's own in-memory database for synalog's tables.
        if not (name.strip('`"').lower() == HOME and path == "':memory:'"):
            outside.append(f"ATTACH {path} AS {name}")
    return outside
