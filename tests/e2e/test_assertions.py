"""End-to-end assertions: the counterexamples of every assertion of
`tests/programs` on a real engine.

Each program states what its assertions must find (`# Expect: holds`,
`violated <n>`, `counterexamples <rows>`); `tests/cli/test_programs.py` checks
it on DuckDB and SQLite. Here the counterexample search compiled for every
engine runs on that engine and must find the same.
"""

from __future__ import annotations

import ast
import re
from pathlib import Path

import pytest

from conftest import ENGINES
from test_e2e import _normalize_rows

PROGRAMS = Path(__file__).resolve().parents[1] / "programs"
EXPECT = re.compile(r"^#\s*Expect:\s*(holds|violated|counterexamples)\s+(\S+)\s*(.*)$")


def expectations():
    """(program, reference, kind, rest) for every assertion expectation."""
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
    return [
        pytest.param(engine, path, ref, kind, rest, id=f"{engine}-{path.parent.name}/{path.stem}-{kind}-{ref}")
        for engine in ENGINES
        for path, kind, ref, rest in expectations()
    ]


@pytest.mark.parametrize(("engine", "path", "ref", "kind", "rest"), _params())
def test_assertion_counterexamples(runner_for, engine, path, ref, kind, rest):
    import synalog

    runner = runner_for(engine)
    predicate, name = ref.split(".", 1)
    sql = synalog.counterexamples(
        path.read_text(), predicate, name, engine=engine, import_root=[str(path.parent)]
    )
    found = _normalize_rows(runner.run(sql))
    if kind == "holds":
        assert found == [], f"{ref} has counterexamples {found}"
    elif kind == "violated":
        assert len(found) == int(rest), f"{ref}: {len(found)} counterexamples {found}, expected {rest}"
    else:
        want = _normalize_rows([tuple(row) for row in ast.literal_eval(rest.lstrip("= ").strip())])
        assert found == want, f"{ref}: got {found}, expected {want}"
