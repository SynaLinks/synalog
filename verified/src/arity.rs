// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Arity consistency: every definition of a predicate declares the same number
//! of arguments.
//!
//! The verifier reads each rule's head into a `(predicate, arity)` pair (an AST
//! walk outside this proof) and must reject a predicate defined once with one
//! arity and again with another — a mismatch compiles to a `UNION ALL` of rows
//! of different widths, which SQL refuses. [`first_arity_conflict`] is that
//! decision, proved to report a genuine conflict (two definitions of one
//! predicate with different arities) and, when it reports none, to guarantee
//! every predicate's definitions agree.
//!
//! Predicate names are interned to `u64` symbols for the kernel.

use vstd::prelude::*;

verus! {

/// Every two definitions of the same predicate declare the same arity.
pub open spec fn consistent(defs: Seq<(u64, usize)>) -> bool {
    forall|i: int, j: int|
        0 <= i < j < defs.len() && (#[trigger] defs[i]).0 == (#[trigger] defs[j]).0
            ==> defs[i].1 == defs[j].1
}

/// Two definitions of one predicate that disagree on arity, or `None` when the
/// definitions are consistent.
pub fn first_arity_conflict(defs: &Vec<(u64, usize)>) -> (r: Option<(usize, usize)>)
    ensures
        match r {
            Some((i, j)) => {
                &&& i < j
                &&& j < defs.len()
                &&& defs@[i as int].0 == defs@[j as int].0
                &&& defs@[i as int].1 != defs@[j as int].1
            },
            None => consistent(defs@),
        },
{
    let mut j: usize = 0;
    while j < defs.len()
        invariant
            j <= defs.len(),
            forall|a: int, b: int|
                0 <= a < b < j && (#[trigger] defs@[a]).0 == (#[trigger] defs@[b]).0
                    ==> defs@[a].1 == defs@[b].1,
        decreases defs.len() - j,
    {
        let mut i: usize = 0;
        while i < j
            invariant
                i <= j,
                j < defs.len(),
                forall|a: int|
                    0 <= a < i && (#[trigger] defs@[a]).0 == defs@[j as int].0
                        ==> defs@[a].1 == defs@[j as int].1,
                forall|a: int, b: int|
                    0 <= a < b < j && (#[trigger] defs@[a]).0 == (#[trigger] defs@[b]).0
                        ==> defs@[a].1 == defs@[b].1,
            decreases j - i,
        {
            if defs[i].0 == defs[j].0 && defs[i].1 != defs[j].1 {
                return Some((i, j));
            }
            i += 1;
        }
        j += 1;
    }
    None
}

} // verus!
