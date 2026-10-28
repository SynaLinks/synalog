// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Variable safety: the decision at the heart of range restriction.
//!
//! A Synalog rule is *safe* only when every variable that must take a value —
//! a head variable (range restriction), a variable used only in a negated
//! literal, a variable aggregated over, a variable merely compared — is *bound*
//! by a positive body literal (or is a value-function input, which the caller
//! binds). The wildcard `_` is never required to be bound.
//!
//! The verifier collects, per rule, the variables of each category and the set
//! of positively-bound variables (`VarCollector`, an AST walk that stays
//! outside this proof). What it then does with those sets — report the ones a
//! rule leaves unbound — is [`unbound`], proved here to report *exactly* the
//! required-but-unbound variables. The corollary [`lemma_all_bound_when_empty`]
//! is the safety guarantee the verifier relies on: when [`unbound`] reports
//! nothing, every variable of the category is the wildcard or is bound.
//!
//! Variables are interned to `u64` symbols for the kernel; the wildcard `_` is
//! whichever id the caller passes as `wildcard` (the verifier reserves one id
//! for it, distinct from every real variable's id).

use vstd::prelude::*;

verus! {

/// Whether `v` is a variable that must be bound but `allowed` does not bind:
/// a non-wildcard variable absent from the positively-bound set. These are
/// exactly the safety violations [`unbound`] reports.
pub open spec fn required_unbound(v: u64, allowed: Seq<u64>, wildcard: u64) -> bool {
    &&& v != wildcard
    &&& !allowed.contains(v)
}

/// Whether `xs` contains `x`, as an executable scan matching `xs@.contains`.
fn vec_contains(xs: &Vec<u64>, x: u64) -> (found: bool)
    ensures found == xs@.contains(x),
{
    let mut i: usize = 0;
    while i < xs.len()
        invariant
            i <= xs.len(),
            forall|j: int| 0 <= j < i ==> xs@[j] != x,
        decreases xs.len() - i,
    {
        if xs[i] == x {
            assert(xs@.contains(x)) by {
                assert(xs@[i as int] == x);
            }
            return true;
        }
        i += 1;
    }
    // No index holds `x`, so the sequence does not contain it.
    assert(!xs@.contains(x)) by {
        if xs@.contains(x) {
            let k = choose|k: int| 0 <= k < xs@.len() && xs@[k] == x;
            assert(xs@[k] != x);
        }
    }
    false
}

/// The variables of `vars` that are required to be bound but are not bound by
/// `allowed` — the safety violations, in the order they appear in `vars`.
///
/// Proved to report *exactly* the required-but-unbound variables: nothing more
/// (soundness — no safe variable is flagged) and nothing less (completeness —
/// no unsafe variable is missed).
pub fn unbound(vars: &Vec<u64>, allowed: &Vec<u64>, wildcard: u64) -> (out: Vec<u64>)
    ensures
        // Soundness: everything reported is genuinely required-and-unbound.
        forall|k: int| 0 <= k < out@.len() ==>
            required_unbound(#[trigger] out@[k], allowed@, wildcard),
        // Completeness: every required-and-unbound variable of `vars` is reported.
        forall|i: int| 0 <= i < vars@.len() ==>
            required_unbound(#[trigger] vars@[i], allowed@, wildcard) ==> out@.contains(vars@[i]),
{
    let mut out: Vec<u64> = Vec::new();
    let mut i: usize = 0;
    while i < vars.len()
        invariant
            i <= vars.len(),
            forall|k: int| 0 <= k < out@.len() ==>
                required_unbound(#[trigger] out@[k], allowed@, wildcard),
            forall|j: int| 0 <= j < i ==>
                required_unbound(#[trigger] vars@[j], allowed@, wildcard) ==> out@.contains(vars@[j]),
        decreases vars.len() - i,
    {
        let v = vars[i];
        let is_wildcard = v == wildcard;
        let is_bound = vec_contains(allowed, v);
        let ghost prev = out@;
        if !is_wildcard && !is_bound {
            out.push(v);
        }
        proof {
            // `out@` is either unchanged or `prev.push(v)`; in both cases every
            // earlier report is kept, so the soundness invariant survives.
            assert forall|k: int| 0 <= k < out@.len() implies
                required_unbound(#[trigger] out@[k], allowed@, wildcard) by {
                if k < prev.len() {
                    assert(out@[k] == prev[k]);
                } else {
                    // The only element beyond `prev` is the pushed `v`, which
                    // is required-and-unbound: not the wildcard, not bound.
                    assert(out@[k] == v);
                }
            }
            // Completeness up to and including `i`: an earlier required-unbound
            // variable stays reported across the push; `vars@[i]`, if it is
            // required-unbound, is exactly the `v` just pushed.
            assert forall|j: int| 0 <= j < i + 1
                && required_unbound(#[trigger] vars@[j], allowed@, wildcard)
                implies out@.contains(vars@[j]) by {
                if j < i as int {
                    let k = choose|k: int| 0 <= k < prev.len() && prev[k] == vars@[j];
                    assert(out@[k] == vars@[j]);
                } else {
                    assert(out@[prev.len() as int] == v);
                }
            }
        }
        i += 1;
    }
    out
}

/// The safety guarantee: when [`unbound`] reports nothing, every variable of
/// the category is the wildcard or is bound by `allowed`. The verifier passes
/// this rule's safety only when `out` is empty, so an accepted rule binds
/// every variable that range restriction (or safe negation/aggregation) asks it
/// to.
pub proof fn lemma_all_bound_when_empty(
    vars: Seq<u64>,
    allowed: Seq<u64>,
    wildcard: u64,
    out: Seq<u64>,
)
    requires
        out.len() == 0,
        forall|i: int| 0 <= i < vars.len() ==>
            required_unbound(#[trigger] vars[i], allowed, wildcard) ==> out.contains(vars[i]),
    ensures
        forall|i: int| 0 <= i < vars.len() ==>
            vars[i] == wildcard || allowed.contains(#[trigger] vars[i]),
{
    assert forall|i: int| 0 <= i < vars.len() implies
        vars[i] == wildcard || allowed.contains(#[trigger] vars[i]) by {
        if required_unbound(vars[i], allowed, wildcard) {
            // It would have to be reported, but nothing is reported.
            assert(out.contains(vars[i]));
            assert(out.len() > 0);
        }
    }
}

} // verus!
