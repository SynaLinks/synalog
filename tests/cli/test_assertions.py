"""Tests for assertions: `assertions`, `counterexamples`, and what `check` reports.

An assertion states, in first-order logic rather than in Synalog, what a predicate
is meant to compute. It is written before the predicate, so the report tells
apart an assertion waiting for its predicates from one that can be checked; checking
it means looking for its counterexamples in a database.

Run with: python -m pytest tests/cli/test_specs.py
"""

from __future__ import annotations

import duckdb
import pytest

import synalog

ASSERTION = '@Assert(Near, transitive: "∀ x y z, Near x y → Near y z → Near x z");'
PARENT = """\
Parent(x: "a", y: "b");
Parent(x: "b", y: "c");
Parent(x: "c", y: "d");
"""
# Two hops only: not transitive.
NEAR = """\
Near(x:, y:) :- Parent(x:, y:);
Near(x:, y: z) :- Parent(x:, y:), Parent(x: y, y: z);
"""
CLOSURE = """\
@Recursive(Near, 20);
Near(x:, y:) :- Parent(x:, y:);
Near(x:, y: z) :- Near(x:, y:), Parent(x: y, y: z);
"""

BAYES = """\
@Assert(Joint,     definition: "∀ h e, Joint h e = Prior h * Likelihood h e");
@Assert(Evidence,  definition: "∀ e, Evidence e = ∑ h, Joint h e");
@Assert(Posterior, definition: "∀ h e, Posterior h e = Joint h e / Evidence e",
                 normalised: "∀ e, ∑ h, Posterior h e = 1",
                 bounded:    "∀ h e, 0 ≤ Posterior h e ∧ Posterior h e ≤ 1");

Prior(h: "sick", p: 0.01);
Prior(h: "healthy", p: 0.99);
Likelihood(h: "sick", e: "positive", p: 0.95);
Likelihood(h: "sick", e: "negative", p: 0.05);
Likelihood(h: "healthy", e: "positive", p: 0.05);
Likelihood(h: "healthy", e: "negative", p: 0.95);

Joint(h:, e:, p:) :- Prior(h:, p: prior), Likelihood(h:, e:, p: lik), p == prior * lik;
Evidence(e:, p? += joint) distinct :- Joint(e:, p: joint);
Posterior(h:, e:, p:) :- Joint(h:, e:, p: joint), Evidence(e:, p: total), p == joint / total;
"""


def violations(source, predicate, name):
    sql = synalog.counterexamples(source, predicate, name)
    return sorted(duckdb.sql(sql).fetchall())


def test_status_follows_the_program():
    (assertion,) = synalog.assertions(ASSERTION)
    assert (assertion["status"], assertion["detail"]) == ("pending", "waiting for Near")
    (assertion,) = synalog.assertions(ASSERTION + PARENT + NEAR)
    assert (assertion["status"], assertion["detail"]) == ("unchecked", None)


def test_report_holds_the_statement():
    (assertion,) = synalog.assertions(ASSERTION + PARENT + NEAR)
    assert assertion == {
        "predicate": "Near",
        "name": "transitive",
        "statement": "∀ x y z, Near x y → Near y z → Near x z",
        "status": "unchecked",
        "detail": None,
    }


def test_spec_before_its_predicate_is_not_an_error():
    assert synalog.check(ASSERTION) == ([], [])


def test_counterexamples_of_a_wrong_rule():
    assert violations(ASSERTION + PARENT + NEAR, "Near", "transitive") == [
        ("a", "b", "d"),
        ("a", "c", "d"),
    ]


def test_no_counterexample_of_a_right_rule():
    assert violations(ASSERTION + PARENT + CLOSURE, "Near", "transitive") == []


def test_arithmetic_and_sums():
    for assertion in synalog.assertions(BAYES):
        assert assertion["status"] == "unchecked", assertion
        assert violations(BAYES, assertion["predicate"], assertion["name"]) == [], assertion


def test_sum_spec_catches_a_missing_normalisation():
    # Posterior without the division by the evidence: it no longer sums to 1.
    broken = BAYES.replace("p == joint / total", "p == joint")
    assert violations(broken, "Posterior", "normalised") == [("negative",), ("positive",)]
    assert violations(broken, "Posterior", "bounded") == []


def test_invalid_statement_is_a_check_error():
    errors, _ = synalog.check('@Assert(Near, t: "∀ x, Near x →");\n' + PARENT + NEAR)
    assert len(errors) == 1
    assert errors[0].startswith("Invalid assertion 'Near.t': expected a formula")

    errors, _ = synalog.check('@Assert(Near, t: "∀ x, ¬ Near x");\n' + PARENT + NEAR)
    assert errors == [
        "Invalid assertion 'Near.t': 'Near' has 2 columns (x, y) but is applied to 1 argument"
    ]


def test_uncheckable_statement_is_a_warning():
    source = '@Assert(Near, positive: "∀ x, x > 0");\n' + PARENT + NEAR
    assert synalog.check(source) == (
        [],
        [
            "Assertion 'Near.positive' cannot be checked: variable 'x' is not bound "
            "by a predicate, so it has no values to check"
        ],
    )
    with pytest.raises(ValueError, match="cannot be checked"):
        synalog.counterexamples(source, "Near", "positive")


def test_counterexamples_of_a_pending_or_unknown_spec():
    with pytest.raises(ValueError, match="is pending: waiting for Near"):
        synalog.counterexamples(ASSERTION, "Near", "transitive")
    with pytest.raises(ValueError, match="No assertion 'Near.symmetric'"):
        synalog.counterexamples(ASSERTION + PARENT + NEAR, "Near", "symmetric")


def test_specs_do_not_change_the_sql():
    plain = synalog.compile(PARENT + NEAR, "Near")
    assert synalog.compile(ASSERTION + PARENT + NEAR, "Near") == plain


# ---------------------------------------------------------------------------
# check() inside a project: assertions run against its database
# ---------------------------------------------------------------------------

PSQL_PROJECT = '[connection]\nengine = "psql"\nhost = "db.example.com"\ndatabase = "d"\nuser = "u"\n'


@pytest.fixture
def project_db(tmp_path, monkeypatch):
    """A project connected to psql, with duckdb standing in for the server:
    the queries `check` sends are recorded, and executed in memory in duckdb's
    dialect."""
    (tmp_path / "synalog.toml").write_text(PSQL_PROJECT)
    monkeypatch.chdir(tmp_path)
    sent = []
    compile_for = synalog.counterexamples

    def counterexamples(source, predicate, name, limit=None, engine=None, import_root=None):
        assert engine == "psql"
        return compile_for(source, predicate, name, limit=limit, engine="duckdb", import_root=import_root)

    monkeypatch.setattr("synalog.checking._synalog.counterexamples", counterexamples)

    def run_sql(engine, sql, dsn=None, loads=()):
        sent.append((engine, dsn))
        cur = duckdb.connect(":memory:").execute(sql)
        return [col[0] for col in cur.description], cur.fetchall()

    monkeypatch.setattr("synalog.checking.run_sql", run_sql)
    return sent


def test_check_refuses_a_violated_assertion_in_a_project(project_db):
    errors, warnings = synalog.check(ASSERTION + PARENT + NEAR)
    assert warnings == []
    assert len(errors) == 1
    head, counterexamples = errors[0].split("\n")
    assert head == (
        "Assertion 'Near.transitive' is violated: ∀ x y z, Near x y → Near y z → Near x z"
    )
    assert counterexamples.startswith("  counterexamples (x, y, z): ")
    assert "(a, b, d)" in counterexamples and "(a, c, d)" in counterexamples
    # It ran on the project's engine, through the project's connection.
    ((engine, dsn),) = project_db
    assert engine == "psql" and dsn.startswith("postgresql://u@db.example.com:5432/d?")


def test_check_accepts_assertions_that_hold_in_a_project(project_db):
    assert synalog.check(ASSERTION + PARENT + CLOSURE) == ([], [])
    assert len(project_db) == 1


def test_check_quotes_a_few_counterexamples(project_db):
    # Six parents, none of them a parent of itself... asserted to be.
    facts = "".join(f'Parent(x: "p{i}", y: "c{i}");\n' for i in range(6))
    errors, _ = synalog.check('@Assert(Parent, reflexive: "∀ x y, Parent x y → Parent x x");\n' + facts)
    assert errors[0].count("(p") == 3
    assert errors[0].endswith(", ...")


def test_check_can_skip_the_database(project_db):
    assert synalog.check(ASSERTION + PARENT + NEAR, assertions=False) == ([], [])
    assert project_db == []


def test_check_does_not_reach_the_database_for_an_invalid_program(project_db):
    errors, _ = synalog.check(ASSERTION + PARENT + NEAR + "Bad(x:, y:) :- Parent(x:);\n")
    assert len(errors) == 1 and "Unbound variable 'y'" in errors[0]
    assert project_db == []


def test_check_without_assertions_does_not_reach_the_database(project_db):
    assert synalog.check(PARENT + NEAR) == ([], [])
    assert project_db == []


def test_check_outside_a_project_is_offline(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)
    monkeypatch.setattr("synalog.checking.run_sql", lambda *a, **k: pytest.fail("database reached"))
    assert synalog.check(ASSERTION + PARENT + NEAR) == ([], [])


def test_unreachable_database_is_a_warning(tmp_path, monkeypatch):
    (tmp_path / "synalog.toml").write_text(PSQL_PROJECT)
    monkeypatch.chdir(tmp_path)

    def run_sql(engine, sql, dsn=None, loads=()):
        raise OSError("could not connect to server")

    monkeypatch.setattr("synalog.checking.run_sql", run_sql)
    assert synalog.check(ASSERTION + PARENT + NEAR) == (
        [],
        ["Assertions not checked: could not connect to server"],
    )


def test_explicit_dsn_is_a_database(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)
    sent = []

    def run_sql(engine, sql, dsn=None, loads=()):
        sent.append((engine, dsn))
        return ["x", "y", "z"], []

    monkeypatch.setattr("synalog.checking.run_sql", run_sql)
    source = ASSERTION + PARENT + NEAR
    assert synalog.check(source, engine="psql", dsn="postgresql://h/d") == ([], [])
    assert sent == [("psql", "postgresql://h/d")]
