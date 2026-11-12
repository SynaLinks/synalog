"""synalog writes in `synalog_home` only, on every engine, and never the
customer's data.

The suite runs every plan as a user that may write nowhere else
(`runners.py`): here, that the engine itself refuses such a user's write
outside it, and that the statement check refuses it before the engine sees
it. `tests/cli/test_writes_only_in_home.py` reads everything synalog compiles.
"""

from __future__ import annotations

import pytest
from conftest import ENGINES
from synalog.writes import HOME, home
from writes import WriteOutsideHome

# Spark has no access control: there, only the check of each statement guards.
NO_ACCESS_CONTROL = {"databricks"}

# DuckDB has no grants: the customer's data is a database attached read-only,
# and a table created elsewhere lands in the session's own in-memory database,
# which holds no data of the customer's (the statement check refuses it).
SESSION_SCRATCH = {"duckdb"}


# The customer's table, in a schema where synalog's user may only read.
PROBE = "synalog_probe"

# synalog_home where a plan would have made it first.
MAKE_HOME = {
    "sqlite": f"ATTACH DATABASE ':memory:' AS {HOME}",
    "duckdb": f"CREATE SCHEMA IF NOT EXISTS {HOME}",
    "trino": f"CREATE SCHEMA IF NOT EXISTS {HOME}.{HOME}",
    "presto": f"CREATE SCHEMA IF NOT EXISTS {HOME}.{HOME}",
    "clickhouse": f"CREATE DATABASE IF NOT EXISTS {HOME}",
    "mysql": f"CREATE DATABASE IF NOT EXISTS {HOME}",
}


@pytest.mark.parametrize("engine", ENGINES)
def test_the_engine_refuses_a_write_outside_home(runner_for, engine):
    if engine in NO_ACCESS_CONTROL:
        pytest.skip(f"no table access control on {engine}: writes.Audited is the guard")
    runner = runner_for(engine)
    table = PROBE
    create = f"CREATE TABLE {table} (x INTEGER)" + (" ENGINE = Memory" if engine == "clickhouse" else "")
    try:
        # Past the statement check: the engine is what refuses.
        session = runner.open([f"DROP TABLE IF EXISTS {table}", create])
        try:
            refused_writes = [f"INSERT INTO {table} VALUES (1)", f"DROP TABLE {table}"]
            if engine not in SESSION_SCRATCH:
                refused_writes.append("CREATE TABLE synalog_probe_new (x INTEGER)" + (" ENGINE = Memory" if engine == "clickhouse" else ""))
            for statement in refused_writes:
                with pytest.raises(Exception) as refused:
                    session.run(statement)
                assert not isinstance(refused.value, WriteOutsideHome)
            # In synalog_home, it may.
            if engine in MAKE_HOME:
                session.run(MAKE_HOME[engine])
            session.run(f"CREATE TABLE {home(engine)}.synalog_probe AS SELECT 1 AS x" if engine != "clickhouse"
                        else f"CREATE TABLE {home(engine)}.synalog_probe ENGINE = Memory AS SELECT 1 AS x")
            session.run(f"DROP TABLE {home(engine)}.synalog_probe")
            # The customer's table is as it was.
            assert [tuple(r) for r in session.run(f"SELECT COUNT(*) FROM {table}")[1]] == [(0,)]
        finally:
            session.close()
    finally:
        runner.setup(f"DROP TABLE IF EXISTS {table}")


@pytest.mark.parametrize("engine", ENGINES)
def test_the_check_refuses_a_write_outside_home(runner_for, engine):
    runner = runner_for(engine)
    with pytest.raises(WriteOutsideHome):
        runner.run("CREATE TABLE synalog_probe AS SELECT 1 AS x")
