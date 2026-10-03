"""Tests for specs: `specs`, `counterexamples`, and what `check` reports.

A spec states, in first-order logic rather than in Synalog, what a predicate
is meant to compute. It is written before the predicate, so the report tells
apart a spec waiting for its predicates from one that can be checked; checking
it means looking for its counterexamples in a database.

Run with: python -m pytest tests/cli/test_specs.py
"""

from __future__ import annotations

import duckdb
import pytest

import synalog

SPEC = '@Spec(Near, transitive: "∀ x y z, Near x y → Near y z → Near x z");'
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
@Spec(Joint,     definition: "∀ h e, Joint h e = Prior h * Likelihood h e");
@Spec(Evidence,  definition: "∀ e, Evidence e = ∑ h, Joint h e");
@Spec(Posterior, definition: "∀ h e, Posterior h e = Joint h e / Evidence e",
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
    (spec,) = synalog.specs(SPEC)
    assert (spec["status"], spec["detail"]) == ("pending", "waiting for Near")
    (spec,) = synalog.specs(SPEC + PARENT + NEAR)
    assert (spec["status"], spec["detail"]) == ("unchecked", None)


def test_report_holds_the_statement():
    (spec,) = synalog.specs(SPEC + PARENT + NEAR)
    assert spec == {
        "predicate": "Near",
        "name": "transitive",
        "statement": "∀ x y z, Near x y → Near y z → Near x z",
        "status": "unchecked",
        "detail": None,
    }


def test_spec_before_its_predicate_is_not_an_error():
    assert synalog.check(SPEC) == ([], [])


def test_counterexamples_of_a_wrong_rule():
    assert violations(SPEC + PARENT + NEAR, "Near", "transitive") == [
        ("a", "b", "d"),
        ("a", "c", "d"),
    ]


def test_no_counterexample_of_a_right_rule():
    assert violations(SPEC + PARENT + CLOSURE, "Near", "transitive") == []


def test_arithmetic_and_sums():
    for spec in synalog.specs(BAYES):
        assert spec["status"] == "unchecked", spec
        assert violations(BAYES, spec["predicate"], spec["name"]) == [], spec


def test_sum_spec_catches_a_missing_normalisation():
    # Posterior without the division by the evidence: it no longer sums to 1.
    broken = BAYES.replace("p == joint / total", "p == joint")
    assert violations(broken, "Posterior", "normalised") == [("negative",), ("positive",)]
    assert violations(broken, "Posterior", "bounded") == []


def test_invalid_statement_is_a_check_error():
    errors, _ = synalog.check('@Spec(Near, t: "∀ x, Near x →");\n' + PARENT + NEAR)
    assert len(errors) == 1
    assert errors[0].startswith("Invalid spec 'Near.t': expected a formula")

    errors, _ = synalog.check('@Spec(Near, t: "∀ x, ¬ Near x");\n' + PARENT + NEAR)
    assert errors == [
        "Invalid spec 'Near.t': 'Near' has 2 columns (x, y) but is applied to 1 argument"
    ]


def test_uncheckable_statement_is_a_warning():
    source = '@Spec(Near, positive: "∀ x, x > 0");\n' + PARENT + NEAR
    assert synalog.check(source) == (
        [],
        [
            "Spec 'Near.positive' cannot be checked: variable 'x' is not bound "
            "by a predicate, so it has no values to check"
        ],
    )
    with pytest.raises(ValueError, match="cannot be checked"):
        synalog.counterexamples(source, "Near", "positive")


def test_counterexamples_of_a_pending_or_unknown_spec():
    with pytest.raises(ValueError, match="is pending: waiting for Near"):
        synalog.counterexamples(SPEC, "Near", "transitive")
    with pytest.raises(ValueError, match="No spec 'Near.symmetric'"):
        synalog.counterexamples(SPEC + PARENT + NEAR, "Near", "symmetric")


def test_specs_do_not_change_the_sql():
    plain = synalog.compile(PARENT + NEAR, "Near")
    assert synalog.compile(SPEC + PARENT + NEAR, "Near") == plain
