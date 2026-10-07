"""End-to-end programs: the rows every program of `tests/programs` expects,
on every engine.

Each program states the rows a predicate returns (`# Expect: rows`, `page`,
`search`); `tests/cli/test_programs.py` checks them on DuckDB and SQLite. Here
the predicate's plan runs on each engine and must return the same rows, in the
same order: a program orders what it expects.
"""

from __future__ import annotations

import ast
import re
from pathlib import Path

import pytest

from conftest import ENGINES
from test_e2e import _normalize_value

PROGRAMS = Path(__file__).resolve().parents[1] / "programs"
EXPECT = re.compile(r"^#\s*Expect:\s*(rows|page|search)\s+(.*)$")


def expectations():
    """(program, kind, rest) for every rows expectation of a valid program."""
    found = []
    for path in sorted(PROGRAMS.rglob("*.l")):
        if "lib" in path.parts:
            continue
        for line in path.read_text().splitlines():
            m = EXPECT.match(line.strip())
            if m:
                found.append((path, *m.groups()))
    return found


def _params():
    params = []
    for engine in ENGINES:
        for i, (path, kind, rest) in enumerate(expectations()):
            params.append(
                pytest.param(engine, path, kind, rest, id=f"{engine}-{path.parent.name}/{path.stem}-{kind}-{i}")
            )
    return params


def _normalize(rows) -> list[tuple]:
    return [_normalize_value(tuple(row)) for row in rows]


@pytest.mark.parametrize(("engine", "path", "kind", "rest"), _params())
def test_program_rows(runner_for, engine, path, kind, rest):
    import synalog

    runner = runner_for(engine)
    spec, literal = (part.strip() for part in rest.split("=", 1))
    options = {}
    if kind == "rows":
        predicate = spec
    elif kind == "page":
        predicate, limit, offset = spec.split()
        options = {"limit": int(limit), "offset": int(offset)}
    else:
        predicate, pattern = spec.split(" ", 1)
        options = {"pattern": pattern}
    steps = synalog.plan(path.read_text(), predicate, engine=engine, import_root=[str(path.parent)], **options)
    got = _normalize(runner.run_plan(steps))
    want = _normalize(ast.literal_eval(literal))
    assert got == want, f"{predicate} on {engine}: got {got}, expected {want}"
