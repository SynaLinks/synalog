"""Two plans running at once, computing the same predicates, on every engine.

A plan computes the tables synalog grounds itself (a recursion's steps, a
predicate read twice) into tables of its run's own: PostgreSQL's temporary
tables, and elsewhere names unique to the run. Two runs interleaved here (one
computes its tables, the other runs whole, then the first reads its tables)
each read their own rows, and neither's cleanup drops the other's tables.

A table of the program's own `@Ground` is not the run's: it is built in place,
under its name, as in Logica, and runs at once grounding the same predicate
share it (`test_ground_stays.py`).
"""

from __future__ import annotations

import pytest

from conftest import ENGINES

PROGRAM = """
Q(x: {value});
@Recursive(Reach, 30);
Reach(x: 0) distinct;
Reach(x: x + 1) distinct :- Reach(x:), x < {value};
R(x:, n? Max= y) distinct :- Q(x:), Reach(x: y);
"""


def _run(session, statements):
    """Run plan steps without loops; the last statement's rows."""
    rows = []
    for step in statements:
        if step["kind"] == "loop":
            for _ in range(step["repetitions"]):
                changed = session.run(step["changed"])[1]
                if changed and int(changed[0][0] or 0) == 0:
                    break
                for statement in step["body"]:
                    session.run(statement)
        elif any(line.strip() and not line.lstrip().startswith("--") for line in step["sql"].splitlines()):
            rows = session.run(step["sql"])[1]
    return rows


@pytest.mark.parametrize("engine", ENGINES)
def test_interleaved_plans_read_their_own_tables(runner_for, engine):
    import synalog
    from synalog.runners import _drop_working_tables

    runner = runner_for(engine)
    plans = {value: synalog.plan(PROGRAM.format(value=value), "R", engine=engine) for value in (3, 5)}
    first, second = runner.session(), runner.session()
    try:
        # The first run computes its tables, and waits before its last query.
        _run(first, plans[3][:-1])
        # The second runs whole, its cleanup included.
        got_second = _run(second, plans[5])
        _drop_working_tables(plans[5], second)
        # The first then reads its own table, still there.
        got_first = _run(first, plans[3][-1:])
        _drop_working_tables(plans[3], first)
    finally:
        first.close()
        second.close()
    assert [tuple(int(v) for v in row) for row in got_first] == [(3, 3)], engine
    assert [tuple(int(v) for v in row) for row in got_second] == [(5, 5)], engine


def _tag(seconds: int) -> str:
    digits = "0123456789abcdefghijklmnopqrstuvwxyz"
    out = ""
    for _ in range(7):
        out = digits[seconds % 36] + out
        seconds //= 36
    return f"r{out}zzzzzz"


@pytest.mark.parametrize("engine", [e for e in ENGINES if e in ("trino", "presto", "databricks")])
def test_a_run_drops_the_tables_a_killed_run_left(runner_for, engine):
    """A run killed before its end leaves its tables; a later run drops them
    once they are a day old, and no other table."""
    import time

    import synalog
    from synalog.runners import _drop_working_tables, sweep_stale_tables

    from synalog.writes import home

    runner = runner_for(engine)
    now = int(time.time())
    stale = f"{home(engine)}.left_{_tag(now - 2 * 24 * 3600)}"
    recent = f"{home(engine)}.left_{_tag(now - 60)}"
    untagged = f"{home(engine)}.left_untagged"
    steps = synalog.plan("@Ground(Q); Q(x: 1); R(x:) :- Q(x:);", "R", engine=engine)
    s = runner.session()
    try:
        # The plan's first statements create the schema where it is missing.
        s.run(next(step["sql"] for step in steps if "CREATE TABLE" in step.get("sql", "")))
        for table in (stale, recent, untagged):
            s.run(f"DROP TABLE IF EXISTS {table}")
            s.run(f"CREATE TABLE {table} AS SELECT 1 AS x")
        dropped = sweep_stale_tables(steps, s, engine)
        listed = {str(row[1 if engine == "databricks" else 0]).lower() for row in s.run(f"SHOW TABLES IN {home(engine)}" if engine == "databricks" else f"SHOW TABLES FROM {home(engine)}")[1]}
        for table in (recent, untagged):
            s.run(f"DROP TABLE IF EXISTS {table}")
    finally:
        _drop_working_tables(steps, s)
        s.close()
    assert [t.lower() for t in dropped] == [stale.lower()], dropped
    assert stale.split(".")[-1].lower() not in listed
    assert {recent.split(".")[-1].lower(), untagged.split(".")[-1].lower()} <= listed
