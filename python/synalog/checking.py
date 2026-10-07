# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Checking a program: the verifier, then its assertions against the database.

The verifier (``_synalog.check``) is structural: it needs no database and
cannot tell whether an ``@Assert`` holds. Inside a project — a folder with a
``synalog.toml`` that has a ``[connection]`` — the database is known, so
``check`` also looks for the counterexamples of every assertion there and
refuses the program when it finds some.
"""

from __future__ import annotations

import json
import os
from pathlib import Path

from . import _synalog, config, project
from .runners import Session, run_plan, session

DEFAULT_ENGINE = "duckdb"

#: Counterexamples quoted in the error of a violated assertion.
SHOWN = 3


def program_engine(source: str, roots: list[str] | None) -> str | None:
    """Return the engine declared via @Engine, or None."""
    ast = json.loads(_synalog.parse(source, import_root=roots))
    for rule in ast.get("rule", []):
        head = rule.get("head", {})
        if head.get("predicate_name") != "@Engine":
            continue
        for field_value in head.get("record", {}).get("field_value", []):
            literal = (
                field_value.get("value", {}).get("expression", {}).get("literal", {})
            )
            name = literal.get("the_string", {}).get("the_string")
            if name:
                return name
    return None


def project_engine(project_file: Path | None) -> str | None:
    """The engine the project connects to, if it has a connection."""
    if project_file is None:
        return None
    conn = project.connection(project_file)
    return conn["engine"] if conn else None


def resolve_dsn(engine: str, dsn: str | None, project_file: Path | None) -> str | None:
    """--dsn, else SYNALOG_<ENGINE>_DSN (the runner reads it), else the
    project's connection for this engine; the runner falls back to the saved
    connection when this is None."""
    if dsn or os.environ.get(f"SYNALOG_{engine.upper()}_DSN") or project_file is None:
        return dsn
    if engine not in project.ENGINES:
        return None
    return project.project_dsn(project_file, engine)


def shown_value(value) -> str:
    """A counterexample's value as a report shows it. Values come from the
    database and may hold text written to be read as instructions: text is a
    quoted, escaped literal (`synalog.quote_value`), so it reads as a value."""
    if value is None:
        return "null"
    if isinstance(value, (bool, int, float)):
        return str(value)
    return _synalog.quote_value(value if isinstance(value, str) else str(value))


def _violation(assertion: dict, columns: list[str], rows: list[tuple]) -> str:
    quoted = ", ".join(
        "(" + ", ".join(shown_value(value) for value in row) + ")" for row in rows[:SHOWN]
    )
    more = ", ..." if len(rows) > SHOWN else ""
    return (
        f"Assertion '{assertion['predicate']}.{assertion['name']}' is violated:"
        f" {_synalog.statement_text(assertion['statement'])}\n"
        f"  counterexamples ({', '.join(columns)}): {quoted}{more}"
    )


def violated_assertions(
    source: str,
    engine: str,
    import_root: list[str] | None = None,
    dsn: str | None = None,
    loads=(),
    open_session: Session | None = None,
) -> list[str]:
    """Run every assertion of the program on ``engine``; one message, quoting
    a few counterexamples, per assertion that does not hold. Pending and
    unsupported assertions are skipped. ``open_session`` runs them in a
    session already open (``dsn`` and ``loads`` are then its own)."""
    checked = [
        assertion
        for assertion in _synalog.assertions(source, engine=engine, import_root=import_root)
        if assertion["status"] == "unchecked"
    ]
    if not checked:
        return []
    if open_session is None:
        with session(engine, dsn, loads) as s:
            return violated_assertions(source, engine, import_root, open_session=s)
    errors = []
    for assertion in checked:
        # One row past what is quoted tells whether there are more.
        steps = _synalog.plan(
            source,
            assertion["predicate"],
            limit=SHOWN + 1,
            engine=engine,
            import_root=import_root,
            assertion=assertion["name"],
        )
        columns, rows = run_plan(steps, open_session)
        if rows:
            errors.append(_violation(assertion, columns, rows))
    return errors


def check(
    source: str,
    engine: str | None = None,
    import_root: list[str] | None = None,
    assertions: bool = True,
    dsn: str | None = None,
) -> tuple[list[str], list[str]]:
    """Validate a Synalog program; returns ``(errors, warnings)``, two lists
    of messages. The program is valid when ``errors`` is empty.

    The verifier runs first and needs no database. When the program passes it
    and a database is known — ``dsn``, ``SYNALOG_<ENGINE>_DSN``, or the
    ``[connection]`` of the ``synalog.toml`` found from the current directory —
    its ``@Assert`` statements are run there, and each violated one is an
    error quoting a few counterexamples. A database that cannot be reached is
    a warning, not an error. ``assertions=False`` skips the database.

    ``engine`` overrides the program's ``@Engine`` annotation, which overrides
    the project's engine (default: duckdb). Raises ValueError on syntax errors.
    """
    errors, warnings = _synalog.check(source, engine=engine, import_root=import_root)
    if errors or not assertions:
        return errors, warnings
    if not _synalog.assertions(source, engine=engine, import_root=import_root):
        return errors, warnings
    try:
        project_file = project.find(os.getcwd())
        if project_file is not None:
            config.load_dotenv(project_file.parent)
        resolved = (
            engine
            or program_engine(source, import_root)
            or project_engine(project_file)
            or DEFAULT_ENGINE
        )
        resolved_dsn = resolve_dsn(resolved, dsn, project_file) or os.environ.get(
            f"SYNALOG_{resolved.upper()}_DSN"
        )
        if resolved_dsn is None:
            return errors, warnings  # no database: the verifier's answer stands
        errors.extend(violated_assertions(source, resolved, import_root, resolved_dsn))
    # Each driver has its own exceptions, and none of them is about the
    # program: whatever keeps the database from answering is reported as such.
    except Exception as e:  # noqa: BLE001
        warnings.append(f"Assertions not checked: {e}")
    return errors, warnings
