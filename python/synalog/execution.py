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

from . import _synalog
from .checking import resolve_connection
from .runners import Result, run_plan, session


def execute(
    source: str,
    predicate: str,
    engine: str | None = None,
    project: str | os.PathLike | None = None,
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
    `predicate` instead of its rows. The database is the ``[connection]`` of
    the ``synalog.toml`` found from `project`, a folder (default: the current
    directory), when it is to the engine the program runs on. `loads` is a
    sequence of ``(table, path)`` pairs, files loaded as tables first (duckdb
    and sqlite). Raises ValueError on an invalid program, and the driver's
    errors.
    """
    resolved, connection = resolve_connection(source, engine, project, import_root)
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
    with session(resolved, connection, loads) as s:
        return run_plan(steps, s)
