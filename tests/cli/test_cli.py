"""Tests for the `synalog` command-line interface.

Run with: python -m pytest tests/cli
Needs the wheel installed (maturin develop) and the duckdb package.
"""

from __future__ import annotations

import json
import subprocess
import sys

import pytest

PROGRAM = """\
@OrderBy(Doubled, "doubled");
Doubled(doubled:) distinct :- T(x:), doubled == x * 2;
T(x: 1);
T(x: 2);
T(x: 3);
"""


def synalog(*args: str, stdin: str | None = None, cwd=None):
    return subprocess.run(
        [sys.executable, "-m", "synalog", *args],
        input=stdin,
        capture_output=True,
        text=True,
        cwd=cwd,
    )


@pytest.fixture
def program_file(tmp_path):
    path = tmp_path / "program.l"
    path.write_text(PROGRAM)
    return path


def test_run_prints_table(program_file):
    result = synalog(str(program_file), "run", "Doubled")
    assert result.returncode == 0, result.stderr
    assert "| doubled |" in result.stdout
    assert "| 2" in result.stdout and "| 6" in result.stdout


def test_run_with_sqlite_engine(program_file):
    result = synalog(str(program_file), "run", "Doubled", "--engine", "sqlite")
    assert result.returncode == 0, result.stderr
    assert "| 4" in result.stdout


def test_run_respects_limit(program_file):
    result = synalog(str(program_file), "run", "Doubled", "--limit", "1")
    assert result.returncode == 0, result.stderr
    assert "| 2" in result.stdout
    assert "| 4" not in result.stdout


def test_run_to_csv(program_file):
    result = synalog(str(program_file), "run_to_csv", "Doubled")
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["doubled", "2", "4", "6"]


def test_print_outputs_sql(program_file):
    result = synalog(str(program_file), "print", "Doubled")
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_parse_outputs_json(program_file):
    result = synalog(str(program_file), "parse")
    assert result.returncode == 0, result.stderr
    ast = json.loads(result.stdout)
    assert any(r["head"]["predicate_name"] == "Doubled" for r in ast["rule"])


def test_check_valid_program(program_file):
    result = synalog(str(program_file), "check")
    assert result.returncode == 0
    assert result.stderr == ""


def test_check_invalid_program(tmp_path):
    path = tmp_path / "bad.l"
    path.write_text('Bad(x) :- nonsense !!;\n')
    result = synalog(str(path), "check")
    assert result.returncode == 1
    assert result.stderr != ""


def test_stdin_program():
    result = synalog("-", "print", "Greeting", stdin='Greeting("hi");\n')
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_inline_program_run():
    result = synalog("run", "-c", 'Greeting("hi");', "Greeting")
    assert result.returncode == 0, result.stderr
    assert "| hi" in result.stdout


def test_inline_program_run_with_limit_and_offset():
    result = synalog("run_to_csv", "-c", PROGRAM, "Doubled", "--limit", "1", "--offset", "1")
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["doubled", "4"]


def test_inline_program_predicate_before_option():
    # click may bind the first positional to FILE; with -c it is a predicate.
    result = synalog("print", "Greeting", "-c", 'Greeting("hi");')
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_inline_program_check():
    assert synalog("check", "-c", 'Greeting("hi");').returncode == 0
    bad = synalog("check", "-c", "Bad(x) :- nonsense !!;")
    assert bad.returncode == 1
    assert bad.stderr != ""


def test_inline_program_and_file_conflict(program_file):
    result = synalog(str(program_file), "check", "-c", 'Greeting("hi");')
    assert result.returncode == 2
    assert "mutually exclusive" in result.stderr


def test_inline_program_missing_predicates():
    result = synalog("run", "-c", 'Greeting("hi");')
    assert result.returncode == 2
    assert "PREDICATES" in result.stderr


def test_imports_resolve_against_file_directory(tmp_path):
    (tmp_path / "lib").mkdir()
    (tmp_path / "lib" / "util.l").write_text("T(x: 7);\n")
    main = tmp_path / "main.l"
    main.write_text(
        "import lib.util.T;\n"
        "@OrderBy(Out, \"y\");\n"
        "Out(y:) distinct :- T(x:), y == x + 1;\n"
    )
    # cwd far from the program: imports must resolve via the file's directory.
    result = synalog(str(main), "run", "Out", cwd="/")
    assert result.returncode == 0, result.stderr
    assert "| 8" in result.stdout


def test_import_root_flag(tmp_path):
    (tmp_path / "roots" / "lib").mkdir(parents=True)
    (tmp_path / "roots" / "lib" / "util.l").write_text("T(x: 7);\n")
    (tmp_path / "elsewhere").mkdir()
    main = tmp_path / "elsewhere" / "main.l"
    main.write_text("import lib.util.T;\nOut(y:) :- T(x:), y == x;\n")
    failing = synalog(str(main), "check", cwd="/")
    assert failing.returncode == 1
    passing = synalog(
        str(main), "check", "--import-root", str(tmp_path / "roots"), cwd="/"
    )
    assert passing.returncode == 0, passing.stderr


def test_engine_annotation_picks_runner(tmp_path):
    path = tmp_path / "trino.l"
    path.write_text('@Engine("trino");\nGreeting("hi");\n')
    result = synalog(str(path), "run", "Greeting")
    assert result.returncode == 1
    assert "no local runner" in result.stderr


def test_missing_predicate_argument(program_file):
    result = synalog(str(program_file), "run")
    assert result.returncode == 2  # click usage error
    assert "PREDICATES" in result.stderr


def test_missing_command(program_file):
    result = synalog(str(program_file))
    assert result.returncode == 2
    assert "missing command" in result.stderr


def test_unknown_command(program_file):
    result = synalog(str(program_file), "explode")
    assert result.returncode == 2
    assert "unknown command 'explode'" in result.stderr


def test_missing_file():
    result = synalog("nonexistent.l", "run", "X")
    assert result.returncode == 1
    assert "No such file" in result.stderr


def test_parse_takes_no_predicates(program_file):
    result = synalog(str(program_file), "parse", "Doubled")
    assert result.returncode == 2
    assert "takes no predicate arguments" in result.stderr


def test_repl_session():
    session = (
        'Greeting("Hello world");\n'
        "Greeting\n"
        "Bad(x) :- nonsense !!;\n"
        ".show\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0
    assert "| Hello world |" in result.stdout
    # the bad rule was rejected and is not part of the program
    assert "Bad" not in result.stdout.split(".show")[-1]
    assert "Could not parse" in result.stderr


@pytest.fixture
def employees_csv(tmp_path):
    path = tmp_path / "employees.csv"
    path.write_text("name,salary\nAlice,75000\nBob,65000\nCharlie,80000\n")
    return path


SENIOR = (
    '@OrderBy(Senior, "name");\n'
    "Senior(name:) distinct :- employees(name:, salary:), salary > 70000;\n"
)


@pytest.mark.parametrize("engine", ["duckdb", "sqlite"])
def test_load_flag(tmp_path, employees_csv, engine):
    program = tmp_path / "senior.l"
    program.write_text(SENIOR)
    result = synalog(
        str(program),
        "run",
        "Senior",
        "--engine",
        engine,
        "--load",
        f"employees={employees_csv}",
    )
    assert result.returncode == 0, result.stderr
    assert "| Alice" in result.stdout and "| Charlie" in result.stdout
    assert "| Bob" not in result.stdout


def test_load_flag_malformed(tmp_path):
    program = tmp_path / "p.l"
    program.write_text('Greeting("hi");\n')
    result = synalog(str(program), "run", "Greeting", "--load", "employees")
    assert result.returncode == 2
    assert "TABLE=PATH" in result.stderr


def test_load_unsupported_format(tmp_path):
    program = tmp_path / "p.l"
    program.write_text("Out(x:) :- employees(x:);\n")
    data = tmp_path / "employees.txt"
    data.write_text("x\n1\n")
    result = synalog(str(program), "run", "Out", "--load", f"employees={data}")
    assert result.returncode == 1
    assert "supported formats" in result.stderr


def test_repl_load_command(employees_csv):
    session = (
        f".load employees {employees_csv}\n"
        "High(name:) :- employees(name:, salary:), salary > 70000;\n"
        "High\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0, result.stderr
    assert "| Alice" in result.stdout


def test_repl_import_then_use(tmp_path):
    (tmp_path / "lib").mkdir()
    (tmp_path / "lib" / "util.l").write_text("T(x: 7);\n")
    session = (
        "import lib.util.T;\n"
        "Out(y:) :- T(x:), y == x + 1;\n"
        "Out\n"
        ".exit\n"
    )
    # REPL import roots default to the cwd
    result = synalog(stdin=session, cwd=tmp_path)
    assert result.returncode == 0, result.stderr
    assert "| 8" in result.stdout
    assert "imported but not used" not in result.stderr


def test_compile_all_excludes_library_predicates():
    import synalog as api

    sqls = api.compile_all("T(x: 1);\nT(x: 2);\nOut(y:) :- T(x:), y == x;\n")
    assert sorted(sqls) == ["Out", "T"]


def test_repl_engine_switch_and_sql():
    session = (
        "Digit(x) :- x in [1, 2];\n"
        ".engine sqlite\n"
        ".sql Digit\n"
        "Digit\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout
    assert "| 1" in result.stdout and "| 2" in result.stdout


def test_init_scaffolds_project(tmp_path):
    result = synalog("init", stdin="kb\nA test knowledge base\n", cwd=tmp_path)
    assert result.returncode == 0, result.stderr
    root = tmp_path / "kb"
    assert (root / ".agents" / "skills" / "synalog" / "SKILL.md").is_file()
    assert (root / ".gitignore").is_file()
    agents = (root / "AGENTS.md").read_text()
    assert "# kb" in agents and "A test knowledge base" in agents
    # the starter program (with its lib/ import) validates and runs out of the box
    assert synalog("example.l", "check", cwd=root).returncode == 0
    run = synalog(
        "example.l",
        "run_to_csv",
        "TopRegion",
        "--load",
        "sales=data/sales.csv",
        cwd=root,
    )
    assert run.returncode == 0, run.stderr
    assert "south,20" in run.stdout


def test_init_refuses_existing_directory(tmp_path):
    (tmp_path / "kb").mkdir()
    result = synalog("init", "kb", stdin="\n", cwd=tmp_path)
    assert result.returncode == 1
    assert "already exists" in result.stderr


# ---------------------------------------------------------------------------
# --search (regex filter across columns)
# ---------------------------------------------------------------------------

CUSTOMERS = """\
@OrderBy(Customer, "name");
Customer(name:, city:) :- Raw(name:, city:);
Raw(name: "Acme Corp", city: "Paris");
Raw(name: "Globex", city: "Berlin");
Raw(name: "Initech", city: "Acmeville");
"""


@pytest.fixture
def customers_file(tmp_path):
    path = tmp_path / "customers.l"
    path.write_text(CUSTOMERS)
    return path


def test_search_filters_rows_on_duckdb(customers_file):
    # Regresses a preamble bug: search wrapped the DuckDB setup DDL inside the
    # subquery, so executing the SQL raised a parser error. This must run.
    result = synalog(str(customers_file), "run", "Customer", "--search", "(?i)acme")
    assert result.returncode == 0, result.stderr
    # Matches "Acme Corp" by name and "Initech" by city "Acmeville"; not Globex.
    assert "Acme Corp" in result.stdout
    assert "Initech" in result.stdout
    assert "Globex" not in result.stdout


def test_search_matches_across_columns(customers_file):
    # Pattern only present in the city column still selects the row.
    result = synalog(str(customers_file), "run", "Customer", "--search", "Berlin")
    assert result.returncode == 0, result.stderr
    assert "Globex" in result.stdout
    assert "Acme Corp" not in result.stdout


def test_search_respects_limit(customers_file):
    # Pagination applies to the filtered rows.
    result = synalog(
        str(customers_file), "run", "Customer", "--search", "(?i)acme", "--limit", "1"
    )
    assert result.returncode == 0, result.stderr
    assert "Acme Corp" in result.stdout
    assert "Initech" not in result.stdout


def test_search_on_sqlite(customers_file):
    result = synalog(
        str(customers_file), "run", "Customer", "--search", "Globex", "--engine", "sqlite"
    )
    assert result.returncode == 0, result.stderr
    assert "Globex" in result.stdout
    assert "Acme Corp" not in result.stdout


def test_print_with_search_emits_filter_sql(customers_file):
    result = synalog(str(customers_file), "print", "Customer", "--search", "Globex")
    assert result.returncode == 0, result.stderr
    assert "_searched" in result.stdout
    assert "Globex" in result.stdout


def test_search_to_csv(customers_file):
    result = synalog(
        str(customers_file), "run_to_csv", "Customer", "--search", "Berlin"
    )
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["name,city", "Globex,Berlin"]


def test_search_rejected_on_check(customers_file):
    result = synalog(str(customers_file), "check", "--search", "x")
    assert result.returncode == 2
    assert "--search applies to print/run/run_to_csv only" in result.stderr


def test_repl_search_command():
    session = (
        'Customer(name: "Acme Corp", city: "Paris");\n'
        'Customer(name: "Globex", city: "Berlin");\n'
        ".search Customer (?i)berlin\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0, result.stderr
    assert "Globex" in result.stdout
    assert "Acme Corp" not in result.stdout
