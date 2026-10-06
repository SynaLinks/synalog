"""synalog.execute and synalog.plan: a recursion runs until it converges.

Run with: python -m pytest tests/cli/test_execution.py
"""

from __future__ import annotations

import pytest

import synalog
from synalog import execution
from synalog.runners import DuckDbSession

CHAIN = """\
Next(x:, y: x + 1) :- x in Range(10);
@Recursive(Reach, DEPTH);
@OrderBy(Reach, "y");
Reach(y: 0) distinct;
Reach(y:) distinct :- Reach(y: x), Next(x:, y:);
"""


class CountingSession(DuckDbSession):
    """A duckdb session that counts the scripts it runs."""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.scripts = 0

    def run(self, script):
        self.scripts += 1
        return super().run(script)


@pytest.fixture
def counted(monkeypatch):
    sessions = []

    def session(engine, dsn=None, loads=()):
        sessions.append(CountingSession(loads))
        return sessions[-1]

    monkeypatch.setattr(execution, "session", session)
    return sessions


def test_a_recursion_stops_when_it_converges(counted):
    # Declared 1000 steps deep; the chain ends after 10.
    columns, rows = synalog.execute(CHAIN.replace("DEPTH", "1000"), "Reach", engine="duckdb")
    assert columns == ["y"]
    assert rows == [(y,) for y in range(11)]
    (session,) = counted
    # Setup statements (the accumulated table's typed empty steps among
    # them, as many whatever the depth), then 3 statements and a check per
    # step: linear in the steps the data needs, not the declared depth.
    assert session.scripts < 4 * 15 + 12


def test_until_convergence_runs_where_compile_cannot():
    source = CHAIN.replace("DEPTH", "-1")
    assert synalog.execute(source, "Reach", engine="sqlite")[1] == [(y,) for y in range(11)]
    with pytest.raises(ValueError, match="more steps than a SQL script can hold"):
        synalog.compile(source, "Reach")


def test_the_depth_still_bounds_the_recursion():
    rows = synalog.execute(CHAIN.replace("DEPTH", "25").replace("Range(10)", "Range(100)"), "Reach")[1]
    assert rows[-1] == (25,)


def test_a_plan_has_a_loop_per_recursion():
    steps = synalog.plan(CHAIN.replace("DEPTH", "40"), "Reach")
    kinds = [step["kind"] for step in steps]
    assert kinds.count("loop") == 1 and kinds[-1] == "sql"
    (loop,) = [step for step in steps if step["kind"] == "loop"]
    assert loop["repetitions"] == 40
    assert loop["changed"].startswith("SELECT COUNT(*)")


def test_execute_paginates_and_searches():
    source = CHAIN.replace("DEPTH", "40")
    assert synalog.execute(source, "Reach", limit=2, offset=3)[1] == [(3,), (4,)]
    assert synalog.execute(source, "Reach", pattern="^1")[1] == [(1,), (10,)]


def test_execute_returns_counterexamples():
    source = '@Assert(Reach, small: "∀ y, Reach y → y < 9");\n' + CHAIN.replace("DEPTH", "40")
    assert synalog.execute(source, "Reach", assertion="small")[1] == [(9,), (10,)]
