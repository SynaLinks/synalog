"""End-to-end tests: compile every fixture with the synalog Python API and
execute the generated SQL on a real engine.

Two layers:
  1. Execution — the SQL is valid for the dialect and runs without error.
  2. Cross-engine consistency — every engine returns the same rows as DuckDB
     (the in-process reference engine) after type normalization.
"""

from __future__ import annotations

import functools
import math
from decimal import Decimal

import pytest

from conftest import ENGINES, fixture_names, plan_fixture, same_program_as_duckdb

# ---------------------------------------------------------------------------
# Layer 1: every fixture executes on its engine
# ---------------------------------------------------------------------------

# Known-unrunnable fixtures, with the reason next to each entry. Keep this
# list shrinking: entries are compiler gaps (tracked in
# tests/compiler_tests/DEVIATIONS.md) or hard engine limitations, never
# convenience skips.
XFAIL_EXECUTE: dict[str, dict[str, str]] = {
    "sqlite": {},
    "duckdb": {},
    "psql": {},
    "trino": {},
    "presto": {},
    "clickhouse": {},
}


def _params(engines, xfail_tables):
    params = []
    for engine in engines:
        for name in fixture_names(engine):
            marks = []
            for table in xfail_tables:
                reason = table.get(engine, {}).get(name)
                if reason:
                    marks.append(pytest.mark.xfail(reason=reason, strict=True))
                    break
            params.append(
                pytest.param(engine, name, id=f"{engine}-{name}", marks=marks)
            )
    return params


@functools.cache
def _engine_rows(engine: str, name: str) -> list[tuple]:
    """The rows of a fixture on an engine, run once per test process: both
    layers read them (a fixture's script can be long on the JVM engines)."""
    from runners import make_runner

    return make_runner(engine).run_plan(plan_fixture(engine, name))


@pytest.mark.parametrize(("engine", "name"), _params(ENGINES, [XFAIL_EXECUTE]))
def test_fixture_executes(runner_for, engine, name):
    runner_for(engine)  # skips when the engine is unavailable
    assert isinstance(_engine_rows(engine, name), list)


# ---------------------------------------------------------------------------
# Layer 2: results agree with DuckDB
# ---------------------------------------------------------------------------

# Fixtures whose values are engine-specific by design and can't be compared
# value-for-value against DuckDB. Keep reasons next to each entry.
XFAIL_CROSS_ENGINE: dict[str, dict[str, str]] = {
    "sqlite": {},
    "duckdb": {},
    "psql": {},
    "trino": {},
    "presto": {},
    "clickhouse": {},
}

# Fixtures aggregating arrays without an element order (++= / ArrayConcatAgg):
# each engine concatenates in its own order, so arrays are compared as sorted
# multisets instead of sequences.
UNORDERED_ARRAYS = {"23_combine"}


def _normalize_value(v):
    """Map engine-specific types onto a common comparison domain."""
    if isinstance(v, Decimal):
        v = float(v)
    if isinstance(v, bool):
        return float(v)  # sqlite has no bool: True comes back as 1
    if isinstance(v, (int, float)):
        return round(float(v), 6)
    if isinstance(v, (list, tuple)):
        return tuple(_normalize_value(x) for x in v)
    if isinstance(v, dict):
        return tuple(sorted((k, _normalize_value(x)) for k, x in v.items()))
    if isinstance(v, str) and v.startswith("["):
        # sqlite represents arrays as JSON text (upstream Logica convention)
        import json

        try:
            return _normalize_value(json.loads(v))
        except ValueError:
            return v
    return v


def same_values(got, want) -> bool:
    """Whether `got` is `want`, normalized values: a float within a relative
    1e-8 of its expected value. An engine's `log` and `exp` need not round as
    DuckDB's: ClickHouse's vectorized ones, on x86, differ in the ninth digit."""
    if isinstance(got, float) and isinstance(want, float):
        return math.isclose(got, want, rel_tol=1e-8, abs_tol=1e-6)
    if isinstance(got, (list, tuple)) and isinstance(want, (list, tuple)):
        return len(got) == len(want) and all(map(same_values, got, want))
    return got == want


def _sort_arrays(v):
    if isinstance(v, tuple):
        return tuple(sorted((_sort_arrays(x) for x in v), key=repr))
    return v


def _normalize_rows(rows: list[tuple], name: str | None = None) -> list[tuple]:
    normalized = (_normalize_value(tuple(r)) for r in rows)
    if name in UNORDERED_ARRAYS:
        normalized = (tuple(_sort_arrays(c) for c in row) for row in normalized)
    return sorted(normalized, key=repr)


@functools.cache
def _reference_rows(name: str) -> list[tuple]:
    from runners import make_runner

    return _normalize_rows(make_runner("duckdb").run_plan(plan_fixture("duckdb", name)), name)


def _cross_engine_params():
    # Only fixtures that execute cleanly on both sides can be compared:
    # exclude anything that xfails execution on the engine or on DuckDB
    # (the reference), and fixtures whose .l program intentionally differs
    # from DuckDB's (per-engine simplified variants compute different
    # results by design), then apply cross-engine xfails.
    duckdb_ok = set(fixture_names("duckdb")) - set(XFAIL_EXECUTE["duckdb"])
    params = []
    for engine in ENGINES:
        if engine == "duckdb":
            continue
        for name in fixture_names(engine):
            if name not in duckdb_ok or name in XFAIL_EXECUTE.get(engine, {}):
                continue
            if not same_program_as_duckdb(engine, name):
                continue
            marks = []
            reason = XFAIL_CROSS_ENGINE.get(engine, {}).get(name)
            if reason:
                marks.append(pytest.mark.xfail(reason=reason, strict=True))
            params.append(
                pytest.param(engine, name, id=f"{engine}-{name}", marks=marks)
            )
    return params


@pytest.mark.parametrize(("engine", "name"), _cross_engine_params())
def test_matches_duckdb(runner_for, engine, name):
    runner_for(engine)  # skips when the engine is unavailable
    rows = _normalize_rows(_engine_rows(engine, name), name)
    want = _reference_rows(name)
    assert same_values(rows, want), f"{rows} != {want}"


# ---------------------------------------------------------------------------
# Layer 3: regex search (synalog.search) executes on every live engine
# ---------------------------------------------------------------------------

# Self-contained program (facts only) so it compiles and runs on every engine
# without external tables.
SEARCH_PROGRAM = """\
@OrderBy(Customer, "name");
Customer(name:, city:) :- Raw(name:, city:);
Raw(name: "Acme Corp", city: "Paris");
Raw(name: "Globex", city: "Berlin");
Raw(name: "Initech", city: "Acmeville");
"""

# "Acme" matches "Acme Corp" by name and "Initech" by its city "Acmeville".
# A plain literal (no inline flags) keeps the pattern portable across every
# engine's regex flavor (POSIX ~, REGEXP, regexp_matches, REGEXP_LIKE).
SEARCH_EXPECTED = [("Acme Corp", "Paris"), ("Initech", "Acmeville")]


@pytest.mark.parametrize("engine", ENGINES)
def test_search_executes_and_filters(runner_for, engine):
    """search() must produce SQL that runs on each engine and OR-matches the
    regex across all columns — exercising the per-dialect string cast
    (TEXT/VARCHAR/STRING) and regex operator, and the preamble placement."""
    import synalog

    runner = runner_for(engine)
    sql = synalog.search(SEARCH_PROGRAM, "Customer", "Acme", engine=engine)
    rows = _normalize_rows(runner.run(sql))
    want = _normalize_rows(SEARCH_EXPECTED)
    assert same_values(rows, want), f"{rows} != {want}"
