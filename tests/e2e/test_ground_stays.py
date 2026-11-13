"""A table of the program's own `@Ground` is built in place, in synalog_home,
and stays there after the run, as in Logica; the next run builds it again
from the data as it is then. The tables synalog grounds itself do not stay.

In one session as synalog's user, which may write in synalog_home only.
"""

from __future__ import annotations

import pytest
from conftest import ENGINES
from synalog.runners import run_plan
from synalog.writes import home
from test_e2e import _normalize_value

PROGRAM = """V(x: {first});
V(x: {second});
@Ground(Kept);
Kept(x:) :- V(x:);
@Ground(Doubled, Twice);
Doubled(x:, y:) :- Kept(x:), y == 2 * x;
@OrderBy(Out, "x");
Out(x:, y:) :- Kept(x:), Doubled(x:, y:), Kept(x: y2), y2 == x;
"""


def rows(session, sql):
    return sorted(_normalize_value(tuple(r)) for r in session.run(sql)[1])


@pytest.mark.parametrize("engine", ENGINES)
def test_a_grounded_table_stays_and_is_built_again(runner_for, engine):
    import synalog

    runner = runner_for(engine)
    session = runner.session()
    try:
        for first, second in ((1, 2), (1, 3)):
            # SQLite's synalog_home is an in-memory database of the
            # connection's, attached by each plan: a connection of its own.
            if engine == "sqlite":
                session.close()
                session = runner.session()
            source = PROGRAM.format(first=first, second=second)
            steps = synalog.plan(source, "Out", engine=engine)
            got = sorted(_normalize_value(tuple(r)) for r in run_plan(steps, session)[1])
            assert got == [(first, 2 * first), (second, 2 * second)]
            # The tables stay, the last run's rows.
            assert rows(session, f"SELECT x FROM {home(engine)}.Kept") == [(first,), (second,)]
            assert rows(session, f"SELECT x, y FROM {home(engine)}.Twice") == [(first, 2 * first), (second, 2 * second)]
    finally:
        session.close()
