# License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

"""Executing a predicate on its database.

`compile` returns one SQL script, for clients that run SQL themselves. A
script cannot loop, so it writes a deep recursion out step by step, up to the
depth `@Recursive` declares. `execute` runs the predicate's plan instead
(`synalog.plan`): each recursion repeats until it converges, so it costs the
steps its data needs whatever its declared depth, and `@Recursive(P, -1)`
(until nothing changes) runs on every engine.
"""

from __future__ import annotations

import os

from . import _synalog, config, project
from .checking import DEFAULT_ENGINE, program_engine, project_engine, resolve_dsn
from .runners import Result, run_plan, session


def resolve_connection(
    source: str,
    engine: str | None,
    dsn: str | None,
    import_root: list[str] | None,
) -> tuple[str, str | None]:
    """The engine and connection string a program runs on: `engine`, else its
    `@Engine`, else the project's (the `synalog.toml` found from the current
    directory), else duckdb; `dsn`, else `SYNALOG_<ENGINE>_DSN`, else the
    project's connection."""
    project_file = project.find(os.getcwd())
    if project_file is not None:
        config.load_dotenv(project_file.parent)
    resolved = (
        engine
        or program_engine(source, import_root)
        or project_engine(project_file)
        or DEFAULT_ENGINE
    )
    return resolved, resolve_dsn(resolved, dsn, project_file)


def execute(
    source: str,
    predicate: str,
    engine: str | None = None,
    dsn: str | None = None,
    import_root: list[str] | None = None,
    limit: int | None = None,
    offset: int | None = None,
    pattern: str | None = None,
    assertion: str | None = None,
    loads=(),
) -> Result:
    """Run `predicate` on its database; ``(columns, rows)``.

    `pattern` keeps the rows where some column matches it (as `search`);
    `assertion` returns the counterexamples of the assertion of that name of
    `predicate` instead of its rows. `loads` is a sequence of ``(table, path)``
    pairs, files loaded as tables first (duckdb and sqlite). Raises
    ValueError on an invalid program, and the driver's errors.
    """
    resolved, resolved_dsn = resolve_connection(source, engine, dsn, import_root)
    steps = _synalog.plan(
        source,
        predicate,
        limit=limit,
        offset=offset,
        engine=resolved,
        import_root=import_root,
        pattern=pattern,
        assertion=assertion,
    )
    with session(resolved, resolved_dsn, loads) as s:
        return run_plan(steps, s)
