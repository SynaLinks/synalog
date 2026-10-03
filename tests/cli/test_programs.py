"""Self-checking programs: every ``.l`` file under ``tests/programs/`` states
what synalog must do with it, in ``# Expect:`` lines, and runs on an in-memory
DuckDB with the facts it defines itself. Adding a test is adding a file.

    # Expect: valid                        the verifier finds no error
    # Expect: error <text>                 an error (parse or verifier) contains <text>
    # Expect: warning <text>               a warning contains <text>
    # Expect: rows <Pred> = <rows>         running <Pred> returns exactly <rows> (a Python literal)
    # Expect: holds <Pred>.<name>          the assertion has no counterexample
    # Expect: violated <Pred>.<name> <n>   the assertion has exactly <n> counterexamples
    # Expect: status <Pred>.<name> <s>     the assertion's status: pending, unchecked, unsupported
    # Expect: same-sql <Pred>              <Pred> compiles to the same SQL without the @Assert lines

Run with: python -m pytest tests/cli/test_programs.py
"""

from __future__ import annotations

import ast
import math
import re
from pathlib import Path

import pytest

import synalog
from synalog.runners import run_sql

PROGRAMS = Path(__file__).resolve().parents[1] / "programs"
EXPECT = re.compile(r"^#\s*Expect:\s*([\w-]+)\s*(.*)$")


def programs() -> list[Path]:
    return sorted(PROGRAMS.rglob("*.l"))


def expectations(source: str) -> list[tuple[str, str]]:
    found = [m.groups() for line in source.splitlines() if (m := EXPECT.match(line.strip()))]
    return [(kind, rest.strip()) for kind, rest in found]


def check(source: str, root: str) -> tuple[list[str], list[str]]:
    """The verifier's (errors, warnings); a parse error is an error."""
    try:
        return synalog.check(source, import_root=[root], assertions=False)
    except ValueError as e:
        return [str(e)], []


def same(actual, expected) -> bool:
    """Rows equal, floats up to 1e-9."""
    if isinstance(actual, (list, tuple)) and isinstance(expected, (list, tuple)):
        return len(actual) == len(expected) and all(same(a, e) for a, e in zip(actual, expected))
    if isinstance(actual, float) or isinstance(expected, float):
        try:
            return math.isclose(float(actual), float(expected), rel_tol=1e-9, abs_tol=1e-9)
        except (TypeError, ValueError):
            return False
    return actual == expected


def assertion(source: str, root: str, ref: str) -> dict:
    predicate, name = ref.split(".", 1)
    for a in synalog.assertions(source, import_root=[root]):
        if a["predicate"] == predicate and a["name"] == name:
            return a
    raise AssertionError(f"no assertion {ref} in the program")


def counterexamples(source: str, root: str, ref: str) -> list[tuple]:
    predicate, name = ref.split(".", 1)
    sql = synalog.counterexamples(source, predicate, name, engine="duckdb", import_root=[root])
    return run_sql("duckdb", sql)[1]


@pytest.mark.parametrize("path", programs(), ids=lambda p: str(p.relative_to(PROGRAMS)))
def test_program(path: Path):
    source = path.read_text()
    root = str(path.parent)
    expected = expectations(source)
    assert expected, f"{path.name} states no '# Expect:' line"
    errors, warnings = check(source, root)
    for kind, rest in expected:
        if kind == "valid":
            assert errors == [], f"expected no error, got {errors}"
        elif kind == "error":
            assert any(rest in e for e in errors), f"no error containing {rest!r} in {errors}"
        elif kind == "warning":
            assert any(rest in w for w in warnings), f"no warning containing {rest!r} in {warnings}"
        elif kind == "rows":
            predicate, literal = (part.strip() for part in rest.split("=", 1))
            assert errors == [], f"the program does not verify: {errors}"
            sql = synalog.compile(source, predicate, engine="duckdb", import_root=[root])
            rows = [tuple(row) for row in run_sql("duckdb", sql)[1]]
            want = [tuple(row) for row in ast.literal_eval(literal)]
            assert same(rows, want), f"{predicate}: got {rows}, expected {want}"
        elif kind == "holds":
            assert errors == [], f"the program does not verify: {errors}"
            assert assertion(source, root, rest)["status"] == "unchecked"
            found = counterexamples(source, root, rest)
            assert found == [], f"{rest} has counterexamples {found}"
        elif kind == "violated":
            ref, count = rest.rsplit(" ", 1)
            assert errors == [], f"the program does not verify: {errors}"
            found = counterexamples(source, root, ref)
            assert len(found) == int(count), f"{ref}: {len(found)} counterexamples {found}, expected {count}"
        elif kind == "same-sql":
            bare = "\n".join(line for line in source.splitlines() if not line.lstrip().startswith("@Assert"))
            with_assertions = synalog.compile(source, rest, engine="duckdb", import_root=[root])
            assert with_assertions == synalog.compile(bare, rest, engine="duckdb", import_root=[root])
        elif kind == "status":
            ref, status = rest.rsplit(" ", 1)
            assert assertion(source, root, ref)["status"] == status
        else:
            raise AssertionError(f"unknown expectation {kind!r}")


def test_there_are_programs():
    assert len(programs()) >= 100
