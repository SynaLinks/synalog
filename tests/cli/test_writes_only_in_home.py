"""synalog writes in `synalog_home` only, on every engine: everything it
compiles is read for its writes (`synalog.writes`, the check the e2e suite
applies to every statement before it runs, where the engines also refuse any
other write: `tests/e2e/test_writes_only_in_home.py`).
"""

from __future__ import annotations

import importlib.util
from pathlib import Path

import pytest
from synalog.writes import writes_outside_home

E2E_DIR = Path(__file__).resolve().parents[1] / "e2e"

# The e2e suite's fixture helpers (which fixtures an engine compiles, and
# their predicate), loaded as a plain module: not as this folder's conftest.
_spec = importlib.util.spec_from_file_location("e2e_fixtures", E2E_DIR / "conftest.py")
E2E = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(E2E)

ENGINES = ["sqlite", "duckdb", "psql", "mysql", "clickhouse", "trino", "presto", "databricks", "bigquery"]


@pytest.mark.parametrize("engine", ENGINES)
def test_everything_synalog_compiles_writes_in_home_only(engine):
    """Every fixture, compiled as a script (`compile`) and as a plan (`plan`,
    what SynaLemma runs) for each engine, BigQuery's too."""
    import synalog

    outside, compiled = {}, 0
    for name in E2E.fixture_names(engine):
        source = E2E.fixture_path(engine, name).read_text()
        import_root = [str(E2E.FIXTURES_DIR)]
        predicate = E2E.last_predicate(source, import_root)
        try:
            script = synalog.compile(source, predicate, engine=engine, import_root=import_root)
            steps = synalog.plan(source, predicate, engine=engine, import_root=import_root)
        except ValueError:
            continue  # refused: it writes nothing
        compiled += 1
        for sql in [script, *(st.get("sql", "") for st in steps), *(b for st in steps for b in st.get("body", []))]:
            found = writes_outside_home(sql, engine)
            if found:
                outside.setdefault(name, []).extend(found)
    assert outside == {}
    assert compiled > 4000


@pytest.mark.parametrize(
    ("sql", "engine", "outside"),
    [
        ("CREATE TABLE synalog_home.Q AS SELECT 1", "duckdb", []),
        ("DROP TABLE IF EXISTS synalog_home.synalog_home.Q", "trino", []),
        ("CREATE SCHEMA IF NOT EXISTS synalog_home.synalog_home", "presto", []),
        # Without the catalog, the session's: the customer's.
        ("DROP TABLE IF EXISTS synalog_home.Q", "trino", ["DROP TABLE IF EXISTS synalog_home.Q"]),
        ("CREATE TABLE memory.synalog_home.Q AS SELECT 1", "presto", ["CREATE TABLE memory.synalog_home.Q"]),
        ("CREATE TABLE pg_temp.Q AS SELECT 1", "psql", []),
        ("CREATE SCHEMA IF NOT EXISTS synalog_home", "psql", []),
        ("ATTACH DATABASE ':memory:' AS synalog_home", "sqlite", []),
        ("SELECT 'DROP TABLE orders'", "psql", []),
        ('SELECT "; DROP TABLE orders; --"', "databricks", []),
        ("DROP TABLE orders", "psql", ["DROP TABLE orders"]),
        ("CREATE TABLE analytics.Q AS SELECT 1", "mysql", ["CREATE TABLE analytics.Q"]),
        ("INSERT INTO sales.orders VALUES (1)", "clickhouse", ["INSERT INTO sales.orders"]),
        ("DO $$ BEGIN create type rec as (a int); END $$", "psql", ["CREATE TYPE rec"]),
        ("CREATE SCHEMA analytics", "psql", ["CREATE SCHEMA analytics"]),
        ("ATTACH DATABASE '/data/biz.db' AS biz", "sqlite", ["ATTACH '/data/biz.db' AS biz"]),
        ("CREATE TABLE synalog_home_x.Q AS SELECT 1", "duckdb", ["CREATE TABLE synalog_home_x.Q"]),
    ],
)
def test_the_check_reads_the_target(sql, engine, outside):
    assert writes_outside_home(sql, engine) == outside


@pytest.mark.parametrize("directive", ['@Dataset("analytics")', '@AttachDatabase(biz, "/tmp/biz.db")'])
def test_no_directive_writes_elsewhere(directive):
    import synalog

    with pytest.raises(ValueError, match="special predicates are allowed"):
        synalog.compile(f"{directive}; @Ground(V); V(x: 1); Q(x:) :- V(x:);", "Q", engine="duckdb")
