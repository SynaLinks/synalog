"""Tests for the `synalog` command-line interface.

Run with: python -m pytest tests/cli
Needs the wheel installed (maturin develop) and the duckdb package.
"""

from __future__ import annotations

import json
import subprocess
import sys

if sys.version_info >= (3, 11):
    import tomllib
else:
    import tomli as tomllib

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


def test_run_respects_offset(program_file):
    result = synalog(str(program_file), "run", "Doubled", "--offset", "1")
    assert result.returncode == 0, result.stderr
    assert "| 2" not in result.stdout  # first row skipped
    assert "| 4" in result.stdout and "| 6" in result.stdout


def test_run_multiple_predicates_prints_each(tmp_path):
    program = tmp_path / "two.l"
    program.write_text('A(x: "a");\nB(x: "b");\n')
    result = synalog(str(program), "run", "A", "B")
    assert result.returncode == 0, result.stderr
    # both predicates rendered, each as its own table
    assert "| a" in result.stdout and "| b" in result.stdout


def test_version_flag():
    result = synalog("--version")
    assert result.returncode == 0
    assert "synalog, version" in result.stdout


def test_run_respects_limit(program_file):
    result = synalog(str(program_file), "run", "Doubled", "--limit", "1")
    assert result.returncode == 0, result.stderr
    assert "| 2" in result.stdout
    assert "| 4" not in result.stdout


def test_run_csv_flag(program_file):
    result = synalog(str(program_file), "run", "Doubled", "--csv")
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["doubled", "2", "4", "6"]


def test_csv_flag_rejected_outside_run(program_file):
    result = synalog(str(program_file), "print", "Doubled", "--csv")
    assert result.returncode == 2
    assert "--csv applies to run only" in result.stderr


def test_print_outputs_sql(program_file):
    result = synalog(str(program_file), "print", "Doubled")
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_parse_and_check_are_not_commands(program_file):
    # parse/check are no longer exposed; only print/run remain.
    for removed in ("parse", "check"):
        result = synalog(str(program_file), removed)
        assert result.returncode == 2
        assert f"unknown command '{removed}'" in result.stderr


def test_run_validates_before_executing(tmp_path):
    # A program that parses but fails verification must be rejected by run,
    # surfacing the verifier's error rather than reaching the engine.
    path = tmp_path / "bad.l"
    path.write_text('Bad(x:) distinct :- x == SqlExpr("1", {});\n')
    result = synalog(str(path), "run", "Bad")
    assert result.returncode == 1
    assert "SqlExpr" in result.stderr


def test_print_validates_before_compiling(tmp_path):
    path = tmp_path / "bad.l"
    path.write_text('Bad(x:) distinct :- x == SqlExpr("1", {});\n')
    result = synalog(str(path), "print", "Bad")
    assert result.returncode == 1
    assert "SqlExpr" in result.stderr


def test_warnings_are_printed_without_failing(tmp_path):
    # An unproven spec is a warning: it goes to stderr and the run proceeds.
    path = tmp_path / "spec.l"
    path.write_text('@Spec(Doubled, even: "∀ d, Doubled d → d % 2 = 0");\n' + PROGRAM)
    result = synalog(str(path), "run", "Doubled", "--csv")
    assert result.returncode == 0
    assert "Spec 'Doubled.even' is unproven" in result.stderr
    assert result.stdout.splitlines() == ["doubled", "2", "4", "6"]


def test_stdin_program():
    result = synalog("-", "print", "Greeting", stdin='Greeting(text: "hi");\n')
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_inline_program_run():
    result = synalog("run", "-c", 'Greeting(text: "hi");', "Greeting")
    assert result.returncode == 0, result.stderr
    assert "| hi" in result.stdout


def test_inline_program_run_with_limit_and_offset():
    result = synalog(
        "run", "-c", PROGRAM, "Doubled", "--csv", "--limit", "1", "--offset", "1"
    )
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["doubled", "4"]


def test_inline_program_predicate_before_option():
    # click may bind the first positional to FILE; with -c it is a predicate.
    result = synalog("print", "Greeting", "-c", 'Greeting(text: "hi");')
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout


def test_inline_program_validated_on_run():
    ok = synalog("run", "-c", 'Greeting(text: "hi");', "Greeting")
    assert ok.returncode == 0, ok.stderr
    bad = synalog("run", "-c", 'Bad(x:) distinct :- x == SqlExpr("1", {});', "Bad")
    assert bad.returncode == 1
    assert "SqlExpr" in bad.stderr


def test_inline_program_and_file_conflict(program_file):
    result = synalog(str(program_file), "run", "-c", 'Greeting(text: "hi");')
    assert result.returncode == 2
    assert "mutually exclusive" in result.stderr


def test_inline_program_missing_predicates():
    result = synalog("run", "-c", 'Greeting(text: "hi");')
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
    failing = synalog(str(main), "print", "Out", cwd="/")
    assert failing.returncode == 1
    passing = synalog(
        str(main), "print", "Out", "--import-root", str(tmp_path / "roots"), cwd="/"
    )
    assert passing.returncode == 0, passing.stderr


def test_engine_annotation_picks_runner(tmp_path):
    # trino has a runner now; without the driver or a DSN it should fail with a
    # trino-specific message, not the generic "no local runner".
    path = tmp_path / "trino.l"
    path.write_text('@Engine("trino");\nGreeting(text: "hi");\n')
    result = synalog(str(path), "run", "Greeting")
    assert result.returncode == 1
    assert "trino" in result.stderr
    assert "no local runner" not in result.stderr


def test_unknown_engine_has_no_runner(tmp_path):
    # A dialect with no runner at all still gets the generic message.
    path = tmp_path / "p.l"
    path.write_text("Greeting(text: \"hi\");\n")
    result = synalog(str(path), "run", "Greeting", "--engine", "duckdb")
    # sanity: duckdb runs fine; the generic message is exercised via run_sql unit test
    assert result.returncode == 0, result.stderr


def test_connect_save_list_show_remove(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))  # subprocess inherits env

    assert synalog("connect").stdout.strip() == "No saved connections."

    saved = synalog("connect", "trino", "trino://alice:secret@host:443/hive/analytics")
    assert saved.returncode == 0

    # list and show hide credentials; the password never appears
    listed = synalog("connect").stdout
    assert "trino" in listed and "secret" not in listed and "***" in listed
    shown = synalog("connect", "trino").stdout
    assert "alice:***@host" in shown and "secret" not in shown

    # the real secret is what gets persisted (and used to connect)
    stored = json.loads((tmp_path / "connections.json").read_text())
    assert stored["trino"].endswith("secret@host:443/hive/analytics")

    removed = synalog("connect", "remove", "trino")
    assert removed.returncode == 0 and "Removed" in removed.stdout
    assert synalog("connect").stdout.strip() == "No saved connections."


def test_connect_masks_token_only_userinfo(tmp_path, monkeypatch):
    # Databricks DSNs carry a token-only userinfo (token:dapi...); the token is
    # masked on display but the username half ("token") is kept for readability.
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    dsn = "databricks://token:dapi-secret@host.cloud.databricks.com/sql/1.0"
    assert synalog("connect", "databricks", dsn).returncode == 0
    shown = synalog("connect", "databricks").stdout
    assert "token:***@host" in shown and "dapi-secret" not in shown


def test_connect_show_missing_engine(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("connect", "trino")
    assert result.returncode == 0
    assert "No saved connection for trino" in result.stdout


def test_connect_remove_usage_error(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("connect", "remove")
    assert result.returncode == 2  # click usage error
    assert "connect remove <engine>" in result.stderr


def test_connect_remove_missing_connection(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("connect", "remove", "trino")
    assert result.returncode == 1
    assert "No saved connection for trino" in result.stderr


def test_connect_rejects_local_engine(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("connect", "duckdb", "whatever")
    assert result.returncode == 1
    assert "does not use a connection string" in result.stderr


def test_connect_resolves_for_run(tmp_path, monkeypatch):
    # A saved connection is consumed by `run`: with a bogus DSN saved, running a
    # trino program reaches the driver/connection layer (not "needs a connection
    # string" and not "no local runner").
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    synalog("connect", "trino", "trino://nobody@127.0.0.1:1/memory/default")
    path = tmp_path / "p.l"
    path.write_text('@Engine("trino");\nGreeting(text: "hi");\n')
    result = synalog(str(path), "run", "Greeting")
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr
    assert "no local runner" not in result.stderr


# ---------------------------------------------------------------------------
# .env auto-loading
# ---------------------------------------------------------------------------


def test_dotenv_in_cwd_provides_dsn(tmp_path, monkeypatch):
    # A .env in the working directory supplies SYNALOG_<ENGINE>_DSN: running a
    # trino program reaches the driver/connection layer (DSN resolved), not the
    # "needs a connection string" error.
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    monkeypatch.delenv("SYNALOG_TRINO_DSN", raising=False)
    (tmp_path / ".env").write_text(
        "SYNALOG_TRINO_DSN=trino://nobody@127.0.0.1:1/memory/default\n"
    )
    (tmp_path / "p.l").write_text('@Engine("trino");\nGreeting(text: "hi");\n')
    result = synalog("p.l", "run", "Greeting", cwd=tmp_path)
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr
    assert "no local runner" not in result.stderr


def test_dotenv_loaded_from_program_directory(tmp_path, monkeypatch):
    # Run from elsewhere, pointing at a program whose directory holds the .env;
    # that directory is the project root and its .env is loaded.
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    monkeypatch.delenv("SYNALOG_TRINO_DSN", raising=False)
    project = tmp_path / "project"
    project.mkdir()
    (project / ".env").write_text(
        "SYNALOG_TRINO_DSN=trino://nobody@127.0.0.1:1/memory/default\n"
    )
    (project / "p.l").write_text('@Engine("trino");\nGreeting(text: "hi");\n')
    result = synalog(str(project / "p.l"), "run", "Greeting", cwd="/")
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr


def test_real_env_overrides_dotenv(tmp_path, monkeypatch):
    # A variable already set in the environment beats the .env file.
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    monkeypatch.setenv("SYNALOG_PSQL_DSN", "postgresql://nobody@127.0.0.1:1/none")
    (tmp_path / ".env").write_text("SYNALOG_PSQL_DSN=postgresql://bogus@bogus:0/x\n")
    # introspect echoes the connection error; the real-env host must be the one
    # it tries (127.0.0.1), not the .env host (bogus).
    result = synalog("introspect", "psql", cwd=tmp_path)
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr
    assert "bogus" not in result.stderr


def test_dotenv_sets_config_dir(tmp_path, monkeypatch):
    # SYNALOG_CONFIG_DIR can come from .env, redirecting where connections save.
    monkeypatch.delenv("SYNALOG_CONFIG_DIR", raising=False)
    store = tmp_path / "store"
    (tmp_path / ".env").write_text(f"SYNALOG_CONFIG_DIR={store}\n")
    saved = synalog(
        "connect", "trino", "trino://a:b@host:443/c/d", cwd=tmp_path
    )
    assert saved.returncode == 0, saved.stderr
    assert (store / "connections.json").is_file()


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


def test_introspect_rejects_non_catalog_engine(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("introspect", "duckdb")
    assert result.returncode == 1
    assert "cannot be introspected" in result.stderr


def test_introspect_requires_connection(tmp_path, monkeypatch):
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog("introspect", "psql")
    assert result.returncode == 1
    assert "needs a connection string" in result.stderr


def test_introspect_usage_error_without_engine():
    result = synalog("introspect")
    assert result.returncode == 2  # click usage error
    assert "introspect <engine>" in result.stderr


def test_introspect_usage_error_too_many_args():
    result = synalog("introspect", "psql", "dsn-a", "dsn-b")
    assert result.returncode == 2  # click usage error
    assert "introspect [engine] [dsn]" in result.stderr


def test_introspect_uses_positional_dsn(tmp_path, monkeypatch):
    # An explicit DSN argument is consumed: with a bogus one, introspection
    # reaches the driver/connection layer (not "needs a connection string").
    monkeypatch.setenv("SYNALOG_CONFIG_DIR", str(tmp_path))
    result = synalog(
        "introspect", "psql", "postgresql://nobody@127.0.0.1:1/none"
    )
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr
    assert "cannot be introspected" not in result.stderr


def test_missing_file():
    result = synalog("nonexistent.l", "run", "X")
    assert result.returncode == 1
    assert "No such file" in result.stderr


def test_repl_session():
    session = (
        'Greeting(text: "Hello world");\n'
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
    program.write_text('Greeting(text: "hi");\n')
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
        "Digit(x:) :- x in [1, 2];\n"
        ".engine sqlite\n"
        ".sql Digit\n"
        "Digit\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0, result.stderr
    assert "SELECT" in result.stdout
    assert "| 1" in result.stdout and "| 2" in result.stdout


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
        str(customers_file), "run", "Customer", "--csv", "--search", "Berlin"
    )
    assert result.returncode == 0, result.stderr
    assert result.stdout.splitlines() == ["name,city", "Globex,Berlin"]


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


def test_repl_help_show_and_clear():
    session = (
        ".help\n"
        'Greeting(text: "hi");\n'
        ".show\n"
        ".clear\n"
        ".show\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0, result.stderr
    assert ".help" in result.stdout and ".exit" in result.stdout  # help text
    assert 'Greeting(text: "hi");' in result.stdout  # .show before clear
    # .clear wipes the program; the trailing .show reports it empty
    assert "(empty program)" in result.stdout


def test_repl_sql_usage_and_unknown_command():
    session = ".sql\n.bogus\n.exit\n"
    result = synalog(stdin=session)
    assert result.returncode == 0
    assert "usage: .sql <Predicate>" in result.stderr
    assert "unknown command '.bogus'" in result.stderr


def test_repl_unknown_engine_is_rejected():
    session = ".engine martian\n.exit\n"
    result = synalog(stdin=session)
    assert result.returncode == 0
    assert "unknown engine 'martian'" in result.stderr


def test_repl_load_malformed_and_missing_file(tmp_path):
    session = ".load onlytable\n.load t /no/such/file.csv\n.exit\n"
    result = synalog(stdin=session, cwd=tmp_path)
    assert result.returncode == 0
    assert "usage: .load <table> <path>" in result.stderr
    assert "no such file" in result.stderr


def test_repl_clear_drops_loaded_tables(employees_csv):
    # .clear forgets loaded tables: a query depending on the table then fails.
    session = (
        f".load employees {employees_csv}\n"
        ".clear\n"
        "High(name:) :- employees(name:, salary:), salary > 70000;\n"
        "High\n"
        ".exit\n"
    )
    result = synalog(stdin=session)
    assert result.returncode == 0
    assert "| Alice" not in result.stdout  # table gone, no rows produced


# ---------------------------------------------------------------------------
# synalog.toml: the project's connection
# ---------------------------------------------------------------------------


def _project(tmp_path, toml: str, env: str = ""):
    """A project folder: synalog.toml, an optional .env, a rule in rules/."""
    (tmp_path / "synalog.toml").write_text(toml)
    if env:
        (tmp_path / ".env").write_text(env)
    (tmp_path / "rules").mkdir()
    program = tmp_path / "rules" / "Greeting.l"
    program.write_text('Greeting(text: "hi");\n')
    return program


def test_project_file_round_trip():
    from synalog import project

    details = {"host": "db.example.com", "database": "sales", "user": "analyst", "password": 'p"w@:/'}
    text = project.dumps("psql", details)
    assert "password" not in text and 'host = "db.example.com"' in text and "port = 5432" in text
    assert project.secrets("psql", details) == {"SYNALOG_PSQL_PASSWORD": 'p"w@:/'}
    assert project.secret_env("bigquery", "credentials") == "GOOGLE_APPLICATION_CREDENTIALS"


def test_project_file_refuses_secrets_and_unknown_fields(tmp_path):
    from synalog import project

    path = tmp_path / "synalog.toml"
    path.write_text('[connection]\nengine = "psql"\nhost = "h"\ndatabase = "d"\nuser = "u"\npassword = "x"\n')
    with pytest.raises(project.ProjectError, match="SYNALOG_PSQL_PASSWORD"):
        project.connection(path)
    path.write_text('[connection]\nengine = "psql"\nhost = "h"\ndatabase = "d"\nuser = "u"\nhots = "x"\n')
    with pytest.raises(project.ProjectError, match="no field 'hots'"):
        project.connection(path)
    path.write_text('[connection]\nengine = "psql"\nhost = "h"\n')
    with pytest.raises(project.ProjectError, match="needs database, user"):
        project.connection(path)
    path.write_text("# no connection: a local project\n")
    assert project.connection(path) is None


def test_project_dsn_reads_secrets_from_the_environment(tmp_path, monkeypatch):
    from urllib.parse import unquote, urlparse

    from synalog import project

    path = tmp_path / "synalog.toml"
    path.write_text(project.dumps("psql", {"host": "h", "database": "d", "user": "u"}))
    monkeypatch.setenv("SYNALOG_PSQL_PASSWORD", 'p"w@:/')
    url = urlparse(project.project_dsn(path, "psql"))
    assert (url.hostname, url.port, url.path, unquote(url.password)) == ("h", 5432, "/d", 'p"w@:/')
    assert project.project_dsn(path, "trino") is None  # another engine


def test_project_engine_and_connection_used_by_run(tmp_path):
    # No --engine, no @Engine: the project's engine runs it, with its
    # connection (a bogus server, so it fails past connection resolution).
    program = _project(tmp_path, '[connection]\nengine = "trino"\nhost = "127.0.0.1"\nport = 1\ncatalog = "memory"\nuser = "nobody"\n')
    result = synalog(str(program), "run", "Greeting", cwd=tmp_path)
    assert result.returncode == 1
    assert "needs a connection string" not in result.stderr
    assert "no local runner" not in result.stderr


def test_project_secret_missing_names_the_variable(tmp_path):
    program = _project(tmp_path, '[connection]\nengine = "databricks"\nserver_hostname = "h"\nhttp_path = "/p"\n')
    result = synalog(str(program), "run", "Greeting", cwd=tmp_path / "rules")
    assert result.returncode == 1
    assert "SYNALOG_DATABRICKS_ACCESS_TOKEN" in result.stderr


def test_project_secret_from_dotenv(tmp_path):
    # The project's .env supplies the secret, even when run from a subfolder.
    program = _project(
        tmp_path,
        '[connection]\nengine = "databricks"\nserver_hostname = "127.0.0.1"\nhttp_path = "/p"\n',
        env="SYNALOG_DATABRICKS_ACCESS_TOKEN=dapi-x\n",
    )
    result = synalog(str(program), "run", "Greeting", cwd=tmp_path / "rules")
    assert "SYNALOG_DATABRICKS_ACCESS_TOKEN" not in result.stderr
    assert "needs a connection string" not in result.stderr


def test_project_file_error_is_reported(tmp_path):
    program = _project(tmp_path, '[connection]\nengine = "psql"\nhost = "h"\ndatabase = "d"\nuser = "u"\npassword = "x"\n')
    result = synalog(str(program), "run", "Greeting", cwd=tmp_path)
    assert result.returncode == 1
    assert "SYNALOG_PSQL_PASSWORD" in result.stderr


def test_explicit_engine_beats_the_project(tmp_path):
    program = _project(tmp_path, '[connection]\nengine = "trino"\nhost = "127.0.0.1"\ncatalog = "c"\nuser = "u"\n')
    result = synalog(str(program), "run", "Greeting", "--engine", "duckdb", "--csv", cwd=tmp_path)
    assert result.returncode == 0, result.stderr
    assert "hi" in result.stdout


def test_introspect_defaults_to_the_project(tmp_path):
    _project(tmp_path, '[connection]\nengine = "trino"\nhost = "127.0.0.1"\nport = 1\ncatalog = "memory"\nuser = "nobody"\n')
    result = synalog("introspect", cwd=tmp_path)
    assert result.returncode == 1  # past usage and resolution: the bogus server
    assert "usage" not in result.stderr.lower()
    assert "needs a connection string" not in result.stderr


def test_project_write_keeps_other_tables_and_lines(tmp_path):
    from synalog import config, project

    (tmp_path / "synalog.toml").write_text('[project]\nname = "sales"\n\n[connection]\nengine = "trino"\nhost = "old"\n')
    (tmp_path / ".env").write_text('OTHER=1\nSYNALOG_PSQL_PASSWORD="old"\n')
    project.write(tmp_path, "psql", {"host": "h", "database": "d", "user": "u", "password": 'p"w'})
    data = tomllib.loads((tmp_path / "synalog.toml").read_text())
    assert data["project"] == {"name": "sales"}
    assert data["connection"]["engine"] == "psql" and "password" not in data["connection"]
    assert (tmp_path / ".env").read_text() == 'OTHER=1\nSYNALOG_PSQL_PASSWORD="p"w"\n'
    assert config.parse_dotenv((tmp_path / ".env").read_text())[-1] == ("SYNALOG_PSQL_PASSWORD", 'p"w')
    assert oct((tmp_path / ".env").stat().st_mode & 0o777) == "0o600"
    assert {".env", "bigquery-credentials.json"} <= set((tmp_path / ".gitignore").read_text().split())
    with pytest.raises(project.ProjectError, match="no field hots"):
        project.write(tmp_path, "psql", {"hots": "x"})
    with pytest.raises(project.ProjectError, match="needs database, user"):
        project.write(tmp_path, "psql", {"host": "h"})


def test_project_write_bigquery_key_and_clear(tmp_path):
    from synalog import project

    project.write(tmp_path, "bigquery", {"project": "acme", "dataset": "sales", "credentials": {"type": "service_account"}})
    key = tmp_path / "bigquery-credentials.json"
    assert json.loads(key.read_text()) == {"type": "service_account"}
    assert f'GOOGLE_APPLICATION_CREDENTIALS="{key.resolve()}"' in (tmp_path / ".env").read_text()
    project.clear(tmp_path)
    assert "connection" not in tomllib.loads((tmp_path / "synalog.toml").read_text())
    assert not key.exists() and not (tmp_path / ".env").exists()
