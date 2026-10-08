"""Unit tests for synalog.runners dispatch and remote-engine wiring.

These exercise the connection-string resolution and the error paths that do
not need a database driver or a live server. The live end-to-end path (a real
query against a running engine) is covered manually with a Trino container.

Run with: python -m pytest tests/cli/test_runners.py
"""

from __future__ import annotations

import pytest

from synalog import runners
from synalog.runners import RunnerUnavailable, run_sql


REMOTE_ENGINES = ["trino", "presto", "databricks", "bigquery"]


def test_unknown_engine_generic_message():
    with pytest.raises(RunnerUnavailable, match="has no local runner"):
        run_sql("oracle", "SELECT 1")


@pytest.mark.parametrize("engine", REMOTE_ENGINES)
def test_remote_engine_missing_driver(engine, monkeypatch):
    # With the driver absent, the runner must raise a clean RunnerUnavailable
    # naming the engine and the pip package — never a bare ImportError.
    import builtins

    real_import = builtins.__import__

    def block(name, *args, **kwargs):
        if name.startswith(("trino", "prestodb", "databricks", "google")):
            raise ImportError(name)
        return real_import(name, *args, **kwargs)

    monkeypatch.setattr(builtins, "__import__", block)
    with pytest.raises(RunnerUnavailable) as excinfo:
        run_sql(engine, "SELECT 1", {"engine": engine})
    assert engine in str(excinfo.value)
    assert "pip install" in str(excinfo.value)


@pytest.mark.parametrize("engine", REMOTE_ENGINES + ["psql"])
def test_remote_engine_rejects_loads(engine):
    with pytest.raises(RunnerUnavailable, match="cannot load local files|cannot load files"):
        run_sql(engine, "SELECT 1", loads=[("t", "/tmp/x.csv")])


@pytest.mark.parametrize("engine", ["trino", "presto", "databricks", "psql", "bigquery"])
def test_remote_engine_needs_the_project_connection(engine):
    # No connection -> what to run, rather than a driver/network failure.
    with pytest.raises(RunnerUnavailable, match=f"needs the project's connection: run 'synalog connect {engine}"):
        run_sql(engine, "SELECT 1")


def test_a_connection_to_another_engine_is_not_used():
    with pytest.raises(RunnerUnavailable, match="needs the project's connection"):
        run_sql("trino", "SELECT 1", {"engine": "psql", "host": "h"})


def test_a_run_leaves_no_working_tables():
    # The steps of a recursion are tables in synalog's schema; once the rows
    # are read, the run drops them (on Presto's memory connector they filled
    # the heap over a long session).
    import synalog

    source = (
        "E(a: 1, b: 2);\nE(a: 2, b: 3);\n@Recursive(R, 25);\n"
        "R(x: 1) distinct;\nR(x: b) distinct :- R(x: a), E(a:, b:);\n"
    )
    s = runners.session("sqlite")
    rows = runners.run_plan(synalog.plan(source, "R", engine="sqlite"), s)[1]
    assert sorted(rows) == [(1,), (2,), (3,)]
    left = s.run("SELECT name FROM logica_test.sqlite_master WHERE type = 'table'")[1]
    assert left == []
