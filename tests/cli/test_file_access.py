"""A program reads tables, never files: a table name that designates a file
(``secret.csv``), a variable of the caller or a URL opens nothing.

Run with: python -m pytest tests/cli/test_file_access.py
"""

from __future__ import annotations

import sqlite3

import pytest

import synalog

duckdb = pytest.importorskip("duckdb")

# What DuckDB reads from a name alone, by its extension.
WRITERS = {
    "csv": lambda path: path.write_text("x\n42\n"),
    "tsv": lambda path: path.write_text("x\n42\n"),
    "json": lambda path: path.write_text('[{"x": 42}]'),
    "jsonl": lambda path: path.write_text('{"x": 42}\n'),
    "ndjson": lambda path: path.write_text('{"x": 42}\n'),
    "parquet": lambda path: duckdb.sql(f"COPY (SELECT 42 AS x) TO '{path}'"),
    "db": lambda path: duckdb.connect(str(path)).execute("CREATE TABLE secret AS SELECT 42 AS x").close(),
    "txt": lambda path: path.write_text("x\n42\n"),
    "xlsx": lambda path: path.write_bytes(b"PK\x03\x04"),
}


@pytest.fixture
def secrets(tmp_path, monkeypatch):
    """A directory holding one file per format, and the process inside it."""
    for extension, write in WRITERS.items():
        write(tmp_path / f"secret.{extension}")
    with sqlite3.connect(tmp_path / "secret.sqlite") as conn:
        conn.execute("CREATE TABLE secret (x)")
        conn.execute("INSERT INTO secret VALUES (42)")
    monkeypatch.chdir(tmp_path)
    return tmp_path


def test_duckdb_alone_would_read_the_file(secrets):
    # The control: what the session is protecting against.
    assert duckdb.connect().sql('SELECT * FROM "secret"."csv"').fetchall() == [(42,)]


@pytest.mark.parametrize("engine", ["duckdb", "sqlite"])
@pytest.mark.parametrize("extension", [*WRITERS, "sqlite"])
@pytest.mark.parametrize("name", ["secret.{}", "`secret.{}`"])
def test_a_table_name_opens_no_file(secrets, engine, extension, name):
    program = f"Q(x:) :- {name.format(extension)}(x:);"
    with pytest.raises(Exception) as refused:  # noqa: B017, PT011 — each engine has its own error
        synalog.execute(program, "Q", engine=engine)
    assert "42" not in str(refused.value)


@pytest.mark.parametrize("name", ["secret.csv.gz", "`secret.csv.gz`", "`main.secret.csv`"])
def test_a_longer_name_opens_no_file(secrets, name):
    (secrets / "secret.csv.gz").write_bytes(b"")
    with pytest.raises(Exception):  # noqa: B017, PT011
        synalog.execute(f"Q(x:) :- {name}(x:);", "Q", engine="duckdb")


def test_a_table_name_takes_no_variable_of_the_caller():
    pandas = pytest.importorskip("pandas")

    secret = pandas.DataFrame({"x": [42]})  # noqa: F841 — in scope on purpose
    with pytest.raises(Exception) as refused:  # noqa: B017, PT011
        synalog.execute("Q(x:) :- secret(x:);", "Q", engine="duckdb")
    assert "does not exist" in str(refused.value)


def test_a_loaded_file_is_still_read(secrets):
    result = synalog.execute("Q(x:) :- secret(x:);", "Q", engine="duckdb", loads=[("secret", str(secrets / "secret.csv"))])
    assert [tuple(row) for row in result[1]] == [(42,)]
