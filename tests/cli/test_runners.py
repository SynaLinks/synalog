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
        run_sql(engine, "SELECT 1", dsn="x://y")
    assert engine in str(excinfo.value)
    assert "pip install" in str(excinfo.value)


@pytest.mark.parametrize("engine", REMOTE_ENGINES + ["psql"])
def test_remote_engine_rejects_loads(engine):
    with pytest.raises(RunnerUnavailable, match="cannot load local files|cannot load files"):
        run_sql(engine, "SELECT 1", loads=[("t", "/tmp/x.csv")])


@pytest.mark.parametrize("engine", ["trino", "presto", "databricks", "psql"])
def test_require_dsn_missing(engine, monkeypatch):
    # No --dsn, no env var, no saved config -> a helpful "needs a connection
    # string" error rather than a driver/network failure.
    monkeypatch.delenv(f"SYNALOG_{engine.upper()}_DSN", raising=False)
    monkeypatch.setattr(runners, "_resolve_dsn", lambda eng, dsn: None)
    with pytest.raises(RunnerUnavailable, match="needs a connection string"):
        run_sql(engine, "SELECT 1")


def test_resolve_dsn_precedence(monkeypatch):
    # flag > env > saved config
    monkeypatch.setenv("SYNALOG_TRINO_DSN", "from-env")
    assert runners._resolve_dsn("trino", "from-flag") == "from-flag"
    assert runners._resolve_dsn("trino", None) == "from-env"
    monkeypatch.delenv("SYNALOG_TRINO_DSN")
    # falls through to the saved connection file (imported lazily inside
    # _resolve_dsn, so patch it where it lives)
    monkeypatch.setattr("synalog.config.saved_connection", lambda eng: "from-config")
    assert runners._resolve_dsn("trino", None) == "from-config"
