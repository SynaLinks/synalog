"""Unit tests for `specs`: the `@Spec` / `@Proof` report.

A spec is written before the predicate it constrains and proved after, so the
report has to tell apart a spec waiting for its predicate, one waiting for its
proof, and one whose proof is written. `check` reports as errors only the
annotations that can never become valid; the rest are warnings.

Run with: python -m pytest tests/cli/test_specs.py
"""

from __future__ import annotations

import synalog

SPEC = '@Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");'
RULE = "Ancestor(x:, y:) :- parent(x:, y:);"
PROOF = '@Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");'


def status(*lines):
    return [spec["status"] for spec in synalog.specs("\n".join(lines))]


def test_status_follows_the_program():
    assert status(SPEC) == ["pending"]
    assert status(SPEC, RULE) == ["unproven"]
    assert status(SPEC, RULE, PROOF) == ["unverified"]


def test_report_holds_statement_and_proof():
    (spec,) = synalog.specs("\n".join([SPEC, RULE, PROOF]))
    assert spec == {
        "predicate": "Ancestor",
        "name": "transitive",
        "statement": "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z",
        "proof": "intro x y z h1 h2; induction h2 <;> aesop",
        "status": "unverified",
    }
    (spec,) = synalog.specs("\n".join([SPEC, RULE]))
    assert spec["proof"] is None


def test_spec_before_its_predicate_is_not_an_error():
    errors, warnings = synalog.check(SPEC)
    assert (errors, warnings) == ([], [])


def test_proof_without_spec_is_an_error():
    errors, _ = synalog.check("\n".join([RULE, PROOF]))
    assert errors == [
        "Proof of 'Ancestor.transitive' has no matching @Spec: "
        'state it with @Spec(Ancestor, transitive: "...")'
    ]
    assert synalog.specs("\n".join([RULE, PROOF])) == []


def test_specs_do_not_change_the_sql():
    plain = synalog.compile(RULE, "Ancestor")
    assert synalog.compile("\n".join([SPEC, RULE, PROOF]), "Ancestor") == plain


def test_check_returns_warnings_apart_from_errors():
    assert synalog.check(RULE) == ([], [])
    assert synalog.check("\n".join([SPEC, RULE])) == (
        [],
        ["Spec 'Ancestor.transitive' is unproven: no matching @Proof"],
    )
    assert synalog.check("\n".join([SPEC, RULE, PROOF])) == (
        [],
        ["Proof of 'Ancestor.transitive' is unverified: proofs are not checked yet"],
    )
