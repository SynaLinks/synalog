"""Pytest configuration for end-to-end tests.

Compiles each fixture in tests/compiler_tests/<engine>/ with the synalog
Python API and executes the SQL against a real engine.

Engine availability:
  - sqlite / duckdb run in-process and are always tested.
  - psql / trino / presto need live servers (see docker-compose.yml here);
    their tests are skipped when the server is unreachable, unless
    SYNALOG_E2E_REQUIRE=psql,trino,presto is set (then unreachable = failure,
    used in CI so missing services can't silently skip).

Engine selection: SYNALOG_E2E_ENGINES=psql (a comma list) runs only the tests
of those engines, so that CI runs each engine in a job of its own.
SYNALOG_E2E_SHARD=2/3 runs the second third of them: CI splits the slow
engines (Trino, Presto, Spark) into jobs that run in parallel.
"""

from __future__ import annotations

import functools
import json
import os
import sys
import zlib
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent))
from runners import make_runner

E2E_DIR = Path(__file__).parent
FIXTURES_DIR = E2E_DIR.parent / "compiler_tests"

# Open-source engines we can execute against. `databricks` runs against an
# Apache Spark Thrift Server as an open-source stand-in (the dialect targets
# Spark SQL; see SparkRunner). bigquery stays compile-only — no comparable
# open-source server.
ENGINES = ["sqlite", "duckdb", "psql", "trino", "presto", "databricks"]

# Fixtures that cannot be compiled through the Python API (none: imports
# resolve through `import_root`, see plan_fixture).
SKIP_COMPILE: set[str] = set()


def fixture_path(engine: str, name: str) -> Path:
    """Source for a fixture: the engine-specific override (or engine-only
    fixture) wins over the canonical engine-independent fixture."""
    override = FIXTURES_DIR / engine / f"{name}.l"
    if override.exists():
        return override
    return FIXTURES_DIR / "fixtures" / f"{name}.l"


def fixture_names(engine: str) -> list[str]:
    """Runnable fixture stems for an engine.

    Skips *_fail and import tests, and any fixture without a golden .sql
    for the engine (those are not validated by the golden suite either).
    """
    names = []
    for path in sorted((FIXTURES_DIR / engine).glob("*.sql")):
        if path.stem.endswith("_fail") or path.stem in SKIP_COMPILE:
            continue
        if not fixture_path(engine, path.stem).exists():
            continue
        names.append(path.stem)
    return names


def same_program_as_duckdb(engine: str, name: str) -> bool:
    """True when the fixture is the same Logica program as DuckDB's version.

    A few fixtures are per-engine override variants (the full feature is
    not supported by that engine's upstream dialect) and compute different
    results by design — those cannot be compared cross-engine.
    """
    mine = fixture_path(engine, name)
    duckdbs = fixture_path("duckdb", name)
    if not mine.exists() or not duckdbs.exists():
        return False
    return mine == duckdbs or mine.read_text() == duckdbs.read_text()


def last_predicate(source: str, import_root: list[str] | None = None) -> str:
    """The predicate of the last rule the fixture itself writes — same
    convention as the Rust golden tests (tests/common/mod.rs), which explain
    it: by the position of each rule's text (`full_text`) in the source."""
    import synalog

    parsed = json.loads(synalog.parse(source, import_root=import_root))
    last, last_position = None, 0
    for rule in parsed.get("rule", []):
        head = rule.get("head", {})
        name = head.get("predicate_name") or head.get("call", {}).get("predicate_name")
        if name == "@Make":
            name = made_predicate(head)
        position = source.find(rule.get("full_text", "\0"))
        if position >= last_position and name and not name.startswith(("@", "_")):
            last, last_position = name, position
    if last is None:
        raise ValueError("No user-defined predicate found")
    return last


def made_predicate(head):
    """The predicate an `@Make` head (`F := G(...)`) defines: its first argument."""
    try:
        value = head["record"]["field_value"][0]["value"]
        return value.get("expression", value)["literal"]["the_predicate"]["predicate_name"]
    except (KeyError, IndexError, TypeError):
        return None


def plan_fixture(engine: str, name: str) -> list[dict]:
    """The plan of a fixture's last predicate for `engine` (``synalog.plan``):
    executed, each recursion stops as soon as it converges."""
    import synalog

    path = fixture_path(engine, name)
    source = path.read_text()
    import_root = [str(FIXTURES_DIR)]
    return synalog.plan(source, last_predicate(source, import_root), engine=engine, import_root=import_root)


@functools.cache
def _engine_status(engine: str) -> str | None:
    """None if the engine is usable, otherwise the reason it isn't."""
    try:
        make_runner(engine).run("SELECT 1")
        return None
    except ImportError as e:
        return f"client library missing: {e}"
    except Exception as e:
        return f"server unreachable: {type(e).__name__}: {e}"


@pytest.fixture(scope="session")
def runner_for():
    """Factory fixture: get a runner for an engine, skipping (or failing,
    for engines listed in SYNALOG_E2E_REQUIRE) when it's unavailable."""
    required = {
        e.strip()
        for e in os.environ.get("SYNALOG_E2E_REQUIRE", "").split(",")
        if e.strip()
    }

    def get(engine: str):
        reason = _engine_status(engine)
        if reason is not None:
            if engine in required:
                pytest.fail(f"engine '{engine}' is required but unavailable — {reason}")
            pytest.skip(f"engine '{engine}' unavailable — {reason}")
        return make_runner(engine)

    return get


def selected_engines():
    """The engines SYNALOG_E2E_ENGINES names (none: every engine)."""
    return {e.strip() for e in os.environ.get("SYNALOG_E2E_ENGINES", "").split(",") if e.strip()}


def selected_shard():
    """(shard, shards) of SYNALOG_E2E_SHARD (`2/3`), 1-based; (1, 1) without it."""
    text = os.environ.get("SYNALOG_E2E_SHARD", "").strip()
    if not text:
        return 1, 1
    try:
        shard, shards = (int(part) for part in text.split("/"))
    except ValueError:
        raise pytest.UsageError(f"SYNALOG_E2E_SHARD: expected a shard like 2/3, got {text!r}")
    if not 1 <= shard <= shards:
        raise pytest.UsageError(f"SYNALOG_E2E_SHARD: shard {shard} of {shards} does not exist")
    return shard, shards


def shard_of(item, shards: int) -> int:
    """The shard (1-based) of a test: by its fixture or program, so that the
    tests of one fixture, which share its rows, run in the same shard; the
    same on every machine (a hash of the name, not Python's salted one)."""
    params = getattr(getattr(item, "callspec", None), "params", {})
    key = params.get("name") or params.get("path") or item.nodeid
    return zlib.crc32(str(key).encode()) % shards + 1


def pytest_configure(config):
    config.addinivalue_line("markers", "engine(name): the engine a test that takes no engine parameter runs on")
    selected_shard()
    unknown = selected_engines() - set(ENGINES)
    if unknown:
        raise pytest.UsageError(f"SYNALOG_E2E_ENGINES: unknown engines {sorted(unknown)} (engines: {ENGINES})")


def item_engine(item):
    """The engine a test runs on: its `engine` parameter, or its `engine` marker."""
    engine = getattr(getattr(item, "callspec", None), "params", {}).get("engine")
    if engine is None and item.get_closest_marker("engine"):
        engine = item.get_closest_marker("engine").args[0]
    return engine


@pytest.hookimpl(tryfirst=True)
def pytest_collection_modifyitems(config, items):
    """With pytest-xdist (`-n 6 --dist loadgroup`), each engine's tests run in
    one worker: the engines run in parallel, the tests of an engine one after
    the other (they write the same tables), and a fixture's rows, computed
    once per worker, serve both layers. First: xdist reads the marker in its
    own hook of this name, to group the tests. With SYNALOG_E2E_ENGINES, the
    tests of other engines are deselected."""
    selected = selected_engines()
    shard, shards = selected_shard()
    if shards > 1:
        others = [item for item in items if shard_of(item, shards) != shard]
        if others:
            config.hook.pytest_deselected(items=others)
            items[:] = [item for item in items if shard_of(item, shards) == shard]
    if selected:
        deselected = [item for item in items if item_engine(item) not in selected]
        if deselected:
            config.hook.pytest_deselected(items=deselected)
            items[:] = [item for item in items if item_engine(item) in selected]
    for item in items:
        engine = item_engine(item)
        if engine:
            item.add_marker(pytest.mark.xdist_group(engine))


def pytest_runtest_logreport(report):
    """Print a failure as soon as it happens (SYNALOG_E2E_PRINT_FAILURES=1):
    a run that is cut short still says which tests failed, and why."""
    if report.failed and os.environ.get("SYNALOG_E2E_PRINT_FAILURES"):
        print(f"\n=== FAILED {report.nodeid} ({report.when}, {report.duration:.0f}s)", flush=True)
        print(report.longreprtext[-4000:], flush=True)
