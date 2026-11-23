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


REMOTE_ENGINES = ["trino", "presto", "databricks", "bigquery", "clickhouse", "mysql"]


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
        if name.startswith(("trino", "prestodb", "databricks", "google", "clickhouse_connect", "pymysql")):
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


@pytest.mark.parametrize("engine", ["trino", "presto", "databricks", "psql", "bigquery", "clickhouse", "mysql"])
def test_remote_engine_needs_the_project_connection(engine):
    # No connection -> what to run, rather than a driver/network failure.
    with pytest.raises(RunnerUnavailable, match=f"needs the project's connection: run 'synalog connect {engine}"):
        run_sql(engine, "SELECT 1")


def test_a_connection_to_another_engine_is_not_used():
    with pytest.raises(RunnerUnavailable, match="needs the project's connection"):
        run_sql("trino", "SELECT 1", {"engine": "psql", "host": "h"})


# ---------------------------------------------------------------------------
# probe: the minimal connection test (SELECT 1, no session setup)
# ---------------------------------------------------------------------------


@pytest.mark.parametrize("engine", REMOTE_ENGINES + ["psql"])
def test_probe_missing_driver(engine, monkeypatch):
    # With the driver absent, probe raises the same RunnerUnavailable as the
    # session would: the engine named, with the pip hint.
    import builtins

    real_import = builtins.__import__

    def block(name, *args, **kwargs):
        if name.startswith(("psycopg", "trino", "prestodb", "databricks", "google", "clickhouse_connect", "pymysql")):
            raise ImportError(name)
        return real_import(name, *args, **kwargs)

    monkeypatch.setattr(builtins, "__import__", block)
    with pytest.raises(RunnerUnavailable) as excinfo:
        runners.probe(engine, {"engine": engine})
    assert engine in str(excinfo.value)
    assert "pip install" in str(excinfo.value)


def test_probe_needs_the_project_connection():
    with pytest.raises(RunnerUnavailable, match="needs the project's connection"):
        runners.probe("psql", None)


def _fake_module(monkeypatch, name):
    import sys
    from unittest import mock

    module = mock.MagicMock(name=name)
    monkeypatch.setitem(sys.modules, name, module)
    return module


def test_probe_psql(monkeypatch):
    psycopg = _fake_module(monkeypatch, "psycopg")
    runners.probe("psql", {
        "engine": "psql", "host": "h", "port": 5433, "database": "d",
        "user": "u", "password": "p", "schema": "s",
    })
    assert psycopg.connect.call_args.kwargs == {
        "host": "h", "port": 5433, "dbname": "d", "user": "u", "password": "p",
        "sslmode": "prefer", "options": "-csearch_path=s", "autocommit": True,
        "connect_timeout": 10,
    }
    conn = psycopg.connect.return_value
    conn.execute.assert_called_once_with("SELECT 1")
    conn.close.assert_called_once()


def test_probe_trino(monkeypatch):
    trino = _fake_module(monkeypatch, "trino")
    runners.probe("trino", {
        "engine": "trino", "host": "h", "user": "u", "catalog": "c",
        "auth": "password", "password": "p",
    })
    trino.auth.BasicAuthentication.assert_called_once_with("u", "p")
    kwargs = trino.dbapi.connect.call_args.kwargs
    assert kwargs["host"] == "h" and kwargs["port"] == 8080
    assert kwargs["http_scheme"] == "https"  # credentials travel over https
    conn = trino.dbapi.connect.return_value
    conn.cursor.return_value.execute.assert_called_once_with("SELECT 1")
    conn.close.assert_called_once()


def test_probe_presto(monkeypatch):
    prestodb = _fake_module(monkeypatch, "prestodb")
    runners.probe("presto", {"engine": "presto", "host": "h", "user": "u", "catalog": "c"})
    kwargs = prestodb.dbapi.connect.call_args.kwargs
    assert kwargs["host"] == "h" and kwargs["http_scheme"] == "http" and kwargs["auth"] is None
    conn = prestodb.dbapi.connect.return_value
    conn.cursor.return_value.execute.assert_called_once_with("SELECT 1")
    conn.close.assert_called_once()


def test_probe_databricks(monkeypatch):
    databricks = _fake_module(monkeypatch, "databricks")
    runners.probe("databricks", {
        "engine": "databricks", "server_hostname": "h", "http_path": "/p",
        "access_token": "t", "catalog": "main",
    })
    # `from databricks import sql` binds the attribute of the databricks module.
    sql = databricks.sql
    kwargs = sql.connect.call_args.kwargs
    assert kwargs["server_hostname"] == "h" and kwargs["access_token"] == "t"
    conn = sql.connect.return_value
    conn.cursor.return_value.execute.assert_called_once_with("SELECT 1")
    conn.close.assert_called_once()


def test_probe_mysql(monkeypatch):
    pymysql = _fake_module(monkeypatch, "pymysql")
    runners.probe("mysql", {"engine": "mysql", "host": "h", "database": "d", "user": "u"})
    kwargs = pymysql.connect.call_args.kwargs
    assert kwargs["host"] == "h" and kwargs["port"] == 3306
    assert kwargs["init_command"] is None  # a probe runs no session setup
    conn = pymysql.connect.return_value
    conn.cursor.return_value.execute.assert_called_once_with("SELECT 1")
    conn.close.assert_called_once()


def test_probe_clickhouse(monkeypatch):
    clickhouse_connect = _fake_module(monkeypatch, "clickhouse_connect")
    runners.probe("clickhouse", {"engine": "clickhouse", "host": "h"})
    kwargs = clickhouse_connect.get_client.call_args.kwargs
    assert kwargs["host"] == "h" and kwargs["port"] == 8123 and not kwargs["secure"]
    client = clickhouse_connect.get_client.return_value
    client.query.assert_called_once_with("SELECT 1")
    client.close.assert_called_once()


def test_probe_bigquery(monkeypatch):
    _fake_module(monkeypatch, "google")
    cloud = _fake_module(monkeypatch, "google.cloud")
    bigquery = cloud.bigquery  # the attribute the `from ... import` binds
    runners.probe("bigquery", {"engine": "bigquery", "project": "p", "dataset": "d"})
    assert bigquery.Client.call_args.kwargs["project"] == "p"
    client = bigquery.Client.return_value
    client.query.assert_called_once_with("SELECT 1")
    client.query.return_value.result.assert_called_once_with()
    client.close.assert_called_once()


def test_a_run_leaves_no_working_tables():
    # The steps of a recursion one query cannot hold (an aggregate in it) are
    # tables in synalog's schema; once the rows are read, the run drops them
    # (on Presto's memory connector they filled the heap over a long session).
    import synalog

    source = (
        "E(a: 1, b: 2);\nE(a: 2, b: 3);\n@Recursive(D, 25);\n"
        "D(n: 1, d? Min= 0) distinct;\nD(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);\n"
    )
    s = runners.session("sqlite")
    rows = runners.run_plan(synalog.plan(source, "D", engine="sqlite"), s)[1]
    assert sorted(rows) == [(1, 0), (2, 1), (3, 2)]
    left = s.run("SELECT name FROM synalog_home.sqlite_master WHERE type = 'table'")[1]
    assert left == []
