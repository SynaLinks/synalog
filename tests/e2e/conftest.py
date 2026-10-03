"""Pytest configuration for end-to-end tests.

Compiles each fixture in tests/compiler_tests/<engine>/ with the synalog
Python API and executes the SQL against a real engine.

Engine availability:
  - sqlite / duckdb run in-process and are always tested.
  - psql / trino / presto need live servers (see docker-compose.yml here);
    their tests are skipped when the server is unreachable, unless
    SYNALOG_E2E_REQUIRE=psql,trino,presto is set (then unreachable = failure,
    used in CI so missing services can't silently skip).
"""

from __future__ import annotations

import functools
import json
import os
import sys
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
# resolve through `import_root`, see compile_fixture).
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


def is_imported_predicate(name: str) -> bool:
    """An imported module's predicate, renamed with its module prefix
    (`Math_utils_Square`): two underscore-separated parts that both start
    uppercase — same rule as tests/common/mod.rs."""
    parts = name.split("_")
    return len(parts) >= 2 and parts[0][:1].isupper() and any(p[:1].isupper() for p in parts[1:])


def last_predicate(source: str, import_root: list[str] | None = None) -> str:
    """Last user-defined predicate in the program — same convention as the
    Rust golden tests (tests/common/mod.rs). An imported module's rules come
    after the program's own, so they are skipped."""
    import synalog

    parsed = json.loads(synalog.parse(source, import_root=import_root))
    last = None
    for rule in parsed.get("rule", []):
        head = rule.get("head", {})
        name = head.get("predicate_name") or head.get("call", {}).get("predicate_name")
        if name and not name.startswith("@") and not name.startswith("_") and not is_imported_predicate(name):
            last = name
    if last is None:
        raise ValueError("No user-defined predicate found")
    return last


def compile_fixture(engine: str, name: str) -> str:
    """Compile a fixture's last predicate to SQL for `engine`."""
    import synalog

    path = fixture_path(engine, name)
    source = path.read_text()
    # Imports (`import lib.segments.X`) resolve from the compiler tests'
    # folder, as in the Rust golden tests (tests/compiler_tests.rs).
    import_root = [str(FIXTURES_DIR)]
    # Pass the engine explicitly: canonical fixtures are engine-independent
    # and carry no @Engine line (same as the golden SQL generator).
    return synalog.compile(source, last_predicate(source, import_root), engine=engine, import_root=import_root)


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
