// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Set membership: which of a list's elements are missing from an allowed set.
//!
//! Several checks share one shape — collect the names a program uses, then
//! reject any the program does not provide. The undefined-predicate check asks
//! it of body references against the defined, built-in and reserved names; the
//! unknown-column check asks it of a named call's columns against the ones its
//! predicate defines. [`absent`] is that decision, proved to report *exactly*
//! the elements missing from `allowed` — nothing present flagged, nothing
//! missing missed — with [`lemma_all_present_when_empty`] the guarantee a
//! caller relies on: report nothing and every element is allowed.
//!
//! Names are interned to `u64` symbols for the kernel.

use vstd::prelude::*;

verus! {

/// The elements of `xs` that `allowed` does not contain, in order. Proved to
/// be exactly those missing — sound (nothing present is reported) and complete
/// (nothing missing is skipped).
pub fn absent(xs: &Vec<u64>, allowed: &Vec<u64>) -> (out: Vec<u64>)
    ensures
        forall|k: int| 0 <= k < out@.len() ==> !allowed@.contains(#[trigger] out@[k]),
        forall|i: int| 0 <= i < xs@.len() ==>
            !allowed@.contains(#[trigger] xs@[i]) ==> out@.contains(xs@[i]),
{
    let mut out: Vec<u64> = Vec::new();
    let mut i: usize = 0;
    while i < xs.len()
        invariant
            i <= xs.len(),
            forall|k: int| 0 <= k < out@.len() ==> !allowed@.contains(#[trigger] out@[k]),
            forall|j: int| 0 <= j < i ==>
                !allowed@.contains(#[trigger] xs@[j]) ==> out@.contains(xs@[j]),
        decreases xs.len() - i,
    {
        let x = xs[i];
        let present = contains(allowed, x);
        let ghost prev = out@;
        if !present {
            out.push(x);
        }
        proof {
            // `out@` is unchanged or `prev.push(x)`; either keeps earlier
            // reports and, in the push case, adds the missing `x`.
            assert forall|k: int| 0 <= k < out@.len() implies
                !allowed@.contains(#[trigger] out@[k]) by {
                if k < prev.len() {
                    assert(out@[k] == prev[k]);
                } else {
                    assert(out@[k] == x);
                }
            }
            assert forall|j: int| 0 <= j < i + 1
                && !allowed@.contains(#[trigger] xs@[j])
                implies out@.contains(xs@[j]) by {
                if j < i as int {
                    let k = choose|k: int| 0 <= k < prev.len() && prev[k] == xs@[j];
                    assert(out@[k] == xs@[j]);
                } else {
                    assert(out@[prev.len() as int] == x);
                }
            }
        }
        i += 1;
    }
    out
}

/// Whether `xs` contains `x`, as an executable scan matching `xs@.contains`.
fn contains(xs: &Vec<u64>, x: u64) -> (found: bool)
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
            assert(xs@[i as int] == x);
            return true;
        }
        i += 1;
    }
    assert(!xs@.contains(x)) by {
        if xs@.contains(x) {
            let k = choose|k: int| 0 <= k < xs@.len() && xs@[k] == x;
            assert(xs@[k] != x);
        }
    }
    false
}

/// The guarantee: when [`absent`] reports nothing, every element of `xs` is in
/// `allowed`.
pub proof fn lemma_all_present_when_empty(xs: Seq<u64>, allowed: Seq<u64>, out: Seq<u64>)
    requires
        out.len() == 0,
        forall|i: int| 0 <= i < xs.len() ==>
            !allowed.contains(#[trigger] xs[i]) ==> out.contains(xs[i]),
    ensures
        forall|i: int| 0 <= i < xs.len() ==> allowed.contains(#[trigger] xs[i]),
{
    assert forall|i: int| 0 <= i < xs.len() implies allowed.contains(#[trigger] xs[i]) by {
        if !allowed.contains(xs[i]) {
            assert(out.contains(xs[i]));
            assert(out.len() > 0);
        }
    }
}

} // verus!
