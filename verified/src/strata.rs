// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Stratum numbering: the soundness of layering a program by negation.
//!
//! A program's predicates depend on one another, each dependency either
//! positive (`P :- Q`) or negated (`P :- ~Q`). A *stratum numbering* assigns
//! each predicate a layer `s` such that a positive dependency never climbs a
//! layer (`s[P] >= s[Q]`) and a negated one drops at least one (`s[P] > s[Q]`):
//! evaluate the low layers first and a negated predicate is always already
//! settled. A program admits such a numbering exactly when it is *stratified* —
//! no recursion runs through a negation — which is what `check_stratification`
//! enforces with the graph cycle kernels.
//!
//! This module proves the numbering's defining soundness property
//! [`lemma_valid_strata_no_negative_cycle`]: a valid numbering witnesses
//! stratification — along any closed walk the layers cannot drop, so no negated
//! dependency can sit on a cycle. [`check_strata`] decides whether a candidate
//! numbering is valid, and [`strata`] produces one (computing a candidate, then
//! validating it — a certificate the proof trusts), returning `None` when none
//! validates.
//!
//! A dependency edge is `(from, to, negated)` over the predicates `0..n`.

use vstd::prelude::*;

verus! {

/// The layer drop a dependency forces: a negated one drops at least one layer,
/// a positive one need not drop at all.
pub open spec fn weight(negated: bool) -> int {
    if negated { 1int } else { 0int }
}

/// A valid stratum numbering: every dependency's `from` sits at least `weight`
/// layers above its `to`, and every endpoint is a real predicate.
pub open spec fn valid_strata(edges: Seq<(usize, usize, bool)>, s: Seq<u64>) -> bool {
    forall|i: int| 0 <= i < edges.len() ==> {
        &&& (#[trigger] edges[i]).0 < s.len()
        &&& edges[i].1 < s.len()
        &&& s[edges[i].0 as int] as int >= s[edges[i].1 as int] as int + weight(edges[i].2)
    }
}

/// A walk through the dependencies: `w` lists edge indices, each edge leaving
/// where the previous one arrived.
pub open spec fn is_walk(edges: Seq<(usize, usize, bool)>, w: Seq<int>) -> bool {
    &&& w.len() >= 1
    &&& forall|i: int| 0 <= i < w.len() ==> 0 <= #[trigger] w[i] < edges.len()
    &&& forall|i: int| 0 <= i < w.len() - 1 ==> edges[#[trigger] w[i]].1 == edges[w[i + 1]].0
}

/// The total layer drop demanded along a walk.
pub open spec fn walk_weight(edges: Seq<(usize, usize, bool)>, w: Seq<int>) -> int
    decreases w.len(),
{
    if w.len() == 0 {
        0int
    } else {
        walk_weight(edges, w.drop_last()) + weight(edges[w.last()].2)
    }
}

/// A walk's weight is never negative: every step drops zero or one layer.
proof fn lemma_walk_weight_nonneg(edges: Seq<(usize, usize, bool)>, w: Seq<int>)
    ensures walk_weight(edges, w) >= 0,
    decreases w.len(),
{
    if w.len() > 0 {
        lemma_walk_weight_nonneg(edges, w.drop_last());
    }
}

/// Dropping the last edge keeps a walk a walk.
proof fn lemma_walk_drop_last(edges: Seq<(usize, usize, bool)>, w: Seq<int>)
    requires is_walk(edges, w), w.len() >= 2,
    ensures is_walk(edges, w.drop_last()),
{
    let front = w.drop_last();
    assert forall|i: int| 0 <= i < front.len() - 1 implies
        edges[#[trigger] front[i]].1 == edges[front[i + 1]].0 by {
        assert(front[i] == w[i] && front[i + 1] == w[i + 1]);
    }
}

/// The key monotonicity: under a valid numbering, the layer of a walk's start
/// stands at least `walk_weight` above the layer of its end.
pub proof fn lemma_strata_walk(edges: Seq<(usize, usize, bool)>, s: Seq<u64>, w: Seq<int>)
    requires valid_strata(edges, s), is_walk(edges, w),
    ensures
        edges[w[0]].0 < s.len(),
        edges[w.last()].1 < s.len(),
        s[edges[w[0]].0 as int] as int >= s[edges[w.last()].1 as int] as int + walk_weight(edges, w),
    decreases w.len(),
{
    // Both endpoints index real edges, so `valid_strata` bounds their layers.
    assert(0 <= w[0] < edges.len());
    assert(0 <= w.last() < edges.len());
    if w.len() == 1 {
        // A single edge: exactly the numbering's per-edge constraint.
        assert(w.drop_last().len() == 0);
        assert(walk_weight(edges, w.drop_last()) == 0);
        assert(walk_weight(edges, w) == weight(edges[w.last()].2));
        assert(w.last() == w[0]);
    } else {
        let front = w.drop_last();
        lemma_walk_drop_last(edges, w);
        lemma_strata_walk(edges, s, front);
        // `front` keeps the first edge; the last edge leaves where `front`
        // arrived, so the two inequalities chain through that shared layer.
        assert(front[0] == w[0]);
        assert(front.last() == w[w.len() - 2]);
        assert(edges[front.last()].1 == edges[w.last()].0);
        assert(walk_weight(edges, w) == walk_weight(edges, front) + weight(edges[w.last()].2));
    }
}

/// Soundness of stratum numbering: a valid numbering witnesses stratification.
/// Along any closed walk (a cycle) the total layer drop is zero, so every edge
/// on it is positive — no negated dependency can lie on a cycle.
pub proof fn lemma_valid_strata_no_negative_cycle(
    edges: Seq<(usize, usize, bool)>,
    s: Seq<u64>,
    w: Seq<int>,
)
    requires
        valid_strata(edges, s),
        is_walk(edges, w),
        edges[w[0]].0 == edges[w.last()].1,
    ensures
        walk_weight(edges, w) == 0,
        forall|i: int| 0 <= i < w.len() ==> !edges[#[trigger] w[i]].2,
{
    lemma_strata_walk(edges, s, w);
    lemma_walk_weight_nonneg(edges, w);
    // start == end gives s[start] >= s[start] + walk_weight, so walk_weight <= 0;
    // non-negative, hence exactly 0.
    assert(walk_weight(edges, w) == 0);
    lemma_walk_all_positive(edges, w);
}

/// A walk of total weight zero has only positive edges (each weight is zero or
/// one, and they sum to zero).
proof fn lemma_walk_all_positive(edges: Seq<(usize, usize, bool)>, w: Seq<int>)
    requires walk_weight(edges, w) == 0,
    ensures forall|i: int| 0 <= i < w.len() ==> !edges[#[trigger] w[i]].2,
    decreases w.len(),
{
    if w.len() > 0 {
        lemma_walk_weight_nonneg(edges, w.drop_last());
        // The last edge's weight is 0, and the front sums to 0.
        assert(!edges[w.last()].2);
        lemma_walk_all_positive(edges, w.drop_last());
        assert forall|i: int| 0 <= i < w.len() implies !edges[#[trigger] w[i]].2 by {
            if i < w.len() - 1 {
                assert(w.drop_last()[i] == w[i]);
            } else {
                assert(w[i] == w.last());
            }
        }
    }
}

/// Whether `s` is a valid stratum numbering for `edges`.
pub fn check_strata(edges: &Vec<(usize, usize, bool)>, s: &Vec<u64>) -> (ok: bool)
    ensures ok == valid_strata(edges@, s@),
{
    let n = s.len();
    let mut i: usize = 0;
    while i < edges.len()
        invariant
            i <= edges.len(),
            n == s.len(),
            forall|j: int| 0 <= j < i ==> {
                &&& (#[trigger] edges@[j]).0 < s@.len()
                &&& edges@[j].1 < s@.len()
                &&& s@[edges@[j].0 as int] as int >= s@[edges@[j].1 as int] as int + weight(edges@[j].2)
            },
        decreases edges.len() - i,
    {
        let (from, to, negated) = edges[i];
        if from >= n || to >= n {
            return false;
        }
        // `s[from] >= s[to] + (negated ? 1 : 0)`, without u64 overflow:
        // `a >= b + 1` is `a > b` on integers.
        let ok = if negated { s[from] > s[to] } else { s[from] >= s[to] };
        if !ok {
            return false;
        }
        i += 1;
    }
    true
}

/// A stratum numbering for `edges` over predicates `0..n`, or `None` when none
/// is valid (the program is not stratified). A candidate is relaxed into shape
/// and then validated by [`check_strata`]; the proof trusts only that
/// validation, so the relaxation needs no specification of its own.
pub fn strata(edges: &Vec<(usize, usize, bool)>, n: usize) -> (result: Option<Vec<u64>>)
    ensures match result {
        Some(s) => s.len() == n && valid_strata(edges@, s@),
        None => true,
    },
{
    let mut s: Vec<u64> = Vec::new();
    let mut i: usize = 0;
    while i < n
        invariant i <= n, s.len() == i,
        decreases n - i,
    {
        s.push(0);
        i += 1;
    }
    // Relax every edge, `n` rounds: enough for a stratified program's layers to
    // settle. Correctness rides on the validation below, not on this loop.
    let mut round: usize = 0;
    while round < n
        invariant s.len() == n,
        decreases n - round,
    {
        let mut e: usize = 0;
        while e < edges.len()
            invariant s.len() == n,
            decreases edges.len() - e,
        {
            let (from, to, negated) = edges[e];
            if from < n && to < n {
                let want = if negated {
                    if s[to] < u64::MAX { s[to] + 1 } else { u64::MAX }
                } else {
                    s[to]
                };
                if s[from] < want {
                    s.set(from, want);
                }
            }
            e += 1;
        }
        round += 1;
    }
    if check_strata(edges, &s) {
        Some(s)
    } else {
        None
    }
}

} // verus!
