// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! When a recursion computed step by step converges.
//!
//! `synalog.execute` runs a recursion as a loop and stops it when a step
//! changes nothing. The loop is bounded by the declared depth, so it always
//! ends (see [`crate::recursion`]); what this module proves is *when* it
//! converges, for the two ways Synalog computes a recursion. Each is a model
//! of what the generated SQL does, not a proof about the SQL itself.
//!
//! **Semi-naive** ([`SemiNaive`], a `distinct` recursion): `full` holds the
//! rows found so far, `delta` the rows the last step added. A step applies
//! the rules to `delta` (Synalog's step also yields the base rows) and keeps
//! the rows not *found* in `full`, by a comparison `same` of two rows. Verus
//! proves:
//!
//!   * [`lemma_converges`]: when `same` is reflexive (a row always matches
//!     itself), the loop adds nothing after as many steps as there are
//!     possible rows, and adds nothing ever after ([`lemma_stays_converged`]);
//!   * [`lemma_unmatched_row_never_converges`]: when a row the step keeps
//!     yielding matches no row, not even itself, every step adds it again.
//!
//! SQL's `=` is not reflexive: a row holding a null equals no row. Under it,
//! a distinct recursion over a row holding a null never converged (3 rows
//! grew to 90 over 30 steps). [`is_reflexive`] and [`sql_equal_not_reflexive`]
//! state both comparisons over rows of nullable columns: Synalog's `is`
//! (`IS NOT DISTINCT FROM`) is reflexive, and the semi-naive step compares
//! rows with it: [`lemma_is_converges`] is the fix, and
//! [`lemma_sql_equal_never_converges_on_null`] the bug it fixed.
//!
//! **Full recomputation of a multiset** ([`Bag`], a recursion that is not
//! `distinct`): every step recomputes the rows from the base and the last
//! step's rows, keeping how many times each occurs, and has converged when
//! every count is unchanged. [`lemma_cycle_never_converges`]: when a row is
//! derived from itself (a cycle in the data), its count grows at every step,
//! so the loop never converges. This is why `@Recursive(P, -1)`, which runs
//! until nothing changes, is refused for a recursion that is not distinct.

use vstd::prelude::*;
#[allow(unused_imports)]
use vstd::set_lib::*;

verus! {

// ---------------------------------------------------------------------------
// Semi-naive evaluation
// ---------------------------------------------------------------------------

/// A semi-naive recursion over rows of type `R`.
#[verifier::reject_recursive_types(R)]
pub struct SemiNaive<R> {
    /// Every row the recursion can produce (finite: a finite database).
    pub universe: Set<R>,
    /// The rows before the first step.
    pub base: Set<R>,
    /// One step's rows from the rows the last step added.
    pub step: spec_fn(Set<R>) -> Set<R>,
    /// Whether a row of `full` matches a candidate row: SQL's comparison of
    /// their columns in the `~P_sn_full(...)` anti-join.
    pub same: spec_fn(R, R) -> bool,
}

/// Every row matches itself.
pub open spec fn reflexive<R>(same: spec_fn(R, R) -> bool) -> bool {
    forall|r: R| #[trigger] same(r, r)
}

impl<R> SemiNaive<R> {
    /// Rows stay within the universe, and a step from no new rows yields
    /// base rows at most (Synalog's step yields the base rows again).
    pub open spec fn well_formed(self) -> bool {
        &&& self.base.subset_of(self.universe)
        &&& forall|d: Set<R>| #[trigger] (self.step)(d).subset_of(self.universe)
        &&& (self.step)(Set::empty()).subset_of(self.base)
    }

    /// Whether `full` holds a row matching `r`.
    pub open spec fn found(self, full: Set<R>, r: R) -> bool {
        exists|f: R| full.contains(f) && #[trigger] (self.same)(f, r)
    }

    /// The rows a step adds: the step's rows not found in `full`.
    pub open spec fn new_rows(self, full: Set<R>, delta: Set<R>) -> Set<R> {
        (self.step)(delta).filter(|r: R| !self.found(full, r))
    }

    /// `(full, delta)` after `k` steps.
    pub open spec fn run(self, k: nat) -> (Set<R>, Set<R>)
        decreases k,
    {
        if k == 0 {
            (self.base, self.base)
        } else {
            let (full, delta) = self.run((k - 1) as nat);
            let new = self.new_rows(full, delta);
            (full.union(new), new)
        }
    }
}

/// `full` holds the base rows, within the universe.
proof fn lemma_full_bounds<R>(m: SemiNaive<R>, k: nat)
    requires
        m.well_formed(),
    ensures
        m.base.subset_of(m.run(k).0),
        m.run(k).0.subset_of(m.universe),
        m.run(k).1.subset_of(m.universe),
    decreases k,
{
    if k > 0 {
        lemma_full_bounds(m, (k - 1) as nat);
        let (full, delta) = m.run((k - 1) as nat);
        assert((m.step)(delta).subset_of(m.universe));
    }
}

/// Under a reflexive comparison, a step adds no row `full` already holds.
proof fn lemma_new_disjoint<R>(m: SemiNaive<R>, full: Set<R>, delta: Set<R>)
    requires
        reflexive(m.same),
    ensures
        full.disjoint(m.new_rows(full, delta)),
{
    assert forall|r: R| m.new_rows(full, delta).contains(r) implies !full.contains(r) by {
        if full.contains(r) {
            assert((m.same)(r, r));
            assert(m.found(full, r));
        }
    }
}

/// A step from no new rows adds nothing: its rows are base rows, found.
proof fn lemma_empty_delta_adds_nothing<R>(m: SemiNaive<R>, k: nat)
    requires
        m.well_formed(),
        reflexive(m.same),
        m.run(k).1 == Set::<R>::empty(),
    ensures
        m.run(k + 1).1 == Set::<R>::empty(),
{
    lemma_full_bounds(m, k);
    let (full, delta) = m.run(k);
    let new = m.new_rows(full, delta);
    assert(m.run(k + 1).1 == new);
    assert forall|r: R| !new.contains(r) by {
        if new.contains(r) {
            assert((m.step)(Set::<R>::empty()).contains(r));
            assert(m.base.contains(r));
            assert(full.contains(r));
            assert((m.same)(r, r));
            assert(m.found(full, r));
        }
    }
    assert(new =~= Set::<R>::empty());
}

/// While steps add rows, `full` grows by one row at least per step.
proof fn lemma_grows<R>(m: SemiNaive<R>, k: nat)
    requires
        m.well_formed(),
        reflexive(m.same),
        k >= 1,
        m.run(k).1 != Set::<R>::empty(),
    ensures
        m.run(k).0.len() >= k,
    decreases k,
{
    let (full, delta) = m.run((k - 1) as nat);
    let new = m.new_rows(full, delta);
    assert(m.run(k) == (full.union(new), new));
    lemma_new_disjoint(m, full, delta);
    lemma_set_disjoint_lens(full, new);
    assert(full.union(new) == full + new);
    lemma_set_empty_equivalency_len(new);
    if k > 1 {
        if delta == Set::<R>::empty() {
            lemma_empty_delta_adds_nothing(m, (k - 1) as nat);
        }
        lemma_grows(m, (k - 1) as nat);
    }
}

/// Under a reflexive comparison, the step after as many steps as there are
/// possible rows adds nothing: the recursion has converged.
pub proof fn lemma_converges<R>(m: SemiNaive<R>)
    requires
        m.well_formed(),
        reflexive(m.same),
    ensures
        m.run(m.universe.len() + 1).1 == Set::<R>::empty(),
{
    let k = m.universe.len() + 1;
    if m.run(k).1 != Set::<R>::empty() {
        lemma_grows(m, k);
        lemma_full_bounds(m, k);
        lemma_len_subset(m.run(k).0, m.universe);
    }
}

/// Once a step adds nothing, no later step does.
pub proof fn lemma_stays_converged<R>(m: SemiNaive<R>, k: nat, j: nat)
    requires
        m.well_formed(),
        reflexive(m.same),
        m.run(k).1 == Set::<R>::empty(),
        k <= j,
    ensures
        m.run(j).1 == Set::<R>::empty(),
    decreases j - k,
{
    if k < j {
        lemma_empty_delta_adds_nothing(m, k);
        lemma_stays_converged(m, k + 1, j);
    }
}

/// A row the step yields every time, which matches no row (itself
/// included), is added by every step: the recursion never converges.
pub proof fn lemma_unmatched_row_never_converges<R>(m: SemiNaive<R>, r: R, k: nat)
    requires
        forall|d: Set<R>| #[trigger] (m.step)(d).contains(r),
        forall|f: R| !#[trigger] (m.same)(f, r),
        m.base.contains(r),
    ensures
        m.run(k).1.contains(r),
    decreases k,
{
    if k > 0 {
        let (full, delta) = m.run((k - 1) as nat);
        assert((m.step)(delta).contains(r));
        assert(!m.found(full, r));
    }
}

// ---------------------------------------------------------------------------
// The two comparisons, over rows of nullable columns
// ---------------------------------------------------------------------------

/// A row: its columns, each a value or null (`None`).
pub type Row = Seq<Option<int>>;

/// SQL's `=` of two rows, column by column: a null equals nothing.
pub open spec fn sql_equal(a: Row, b: Row) -> bool {
    &&& a.len() == b.len()
    &&& forall|i: int| 0 <= i < a.len() ==> {
        &&& (#[trigger] a[i]).is_some()
        &&& b[i].is_some()
        &&& a[i] == b[i]
    }
}

/// Synalog's `is` (`IS NOT DISTINCT FROM`) of two rows, column by column:
/// a null is a null.
pub open spec fn is_equal(a: Row, b: Row) -> bool {
    &&& a.len() == b.len()
    &&& forall|i: int| 0 <= i < a.len() ==> #[trigger] a[i] == b[i]
}

/// `is` is reflexive: a semi-naive step comparing with it converges.
pub proof fn is_reflexive()
    ensures
        reflexive(|a: Row, b: Row| is_equal(a, b)),
{
}

/// SQL's `=` is not: a row holding a null matches no row, itself included.
pub proof fn sql_equal_not_reflexive(r: Row, i: int)
    requires
        0 <= i < r.len(),
        r[i] is None,
    ensures
        forall|f: Row| !#[trigger] sql_equal(f, r),
{
    assert forall|f: Row| !#[trigger] sql_equal(f, r) by {
        if sql_equal(f, r) {
            assert(f[i].is_some() && r[i].is_some());
        }
    }
}

/// The bug: a semi-naive step comparing rows with SQL's `=` adds a row
/// holding a null at every step, when the step keeps yielding it (Synalog's
/// step yields the base rows again).
pub proof fn lemma_sql_equal_never_converges_on_null(m: SemiNaive<Row>, r: Row, i: int, k: nat)
    requires
        m.same == (|a: Row, b: Row| sql_equal(a, b)),
        0 <= i < r.len(),
        r[i] is None,
        forall|d: Set<Row>| #[trigger] (m.step)(d).contains(r),
        m.base.contains(r),
    ensures
        m.run(k).1.contains(r),
{
    sql_equal_not_reflexive(r, i);
    assert forall|f: Row| !#[trigger] (m.same)(f, r) by {
        assert(!sql_equal(f, r));
    }
    lemma_unmatched_row_never_converges(m, r, k);
}

/// The fix: comparing rows with `is`, every semi-naive recursion converges
/// within as many steps as there are possible rows, nulls or not.
pub proof fn lemma_is_converges(m: SemiNaive<Row>)
    requires
        m.same == (|a: Row, b: Row| is_equal(a, b)),
        m.well_formed(),
    ensures
        m.run(m.universe.len() + 1).1 == Set::<Row>::empty(),
{
    is_reflexive();
    lemma_converges(m);
}

// ---------------------------------------------------------------------------
// Full recomputation of a multiset
// ---------------------------------------------------------------------------

/// A recursion that is not `distinct`: each row with how many times it
/// occurs. A step's rows are the base rows and the rules' rows from the
/// last step's.
#[verifier::reject_recursive_types(R)]
pub struct Bag<R> {
    pub base: spec_fn(R) -> nat,
    pub step: spec_fn(spec_fn(R) -> nat) -> spec_fn(R) -> nat,
}

impl<R> Bag<R> {
    /// How many times each row occurs after `k` steps.
    pub open spec fn counts(self, k: nat) -> spec_fn(R) -> nat
        decreases k,
    {
        if k == 0 {
            self.base
        } else {
            let last = self.counts((k - 1) as nat);
            |r: R| (self.base)(r) + ((self.step)(last))(r)
        }
    }
}

/// A base row derived from itself (each occurrence yields one at least: a
/// cycle in the data) occurs more often after every step: the counts never
/// stop changing, and recursing until nothing changes would not end.
pub proof fn lemma_cycle_never_converges<R>(b: Bag<R>, r: R, k: nat)
    requires
        (b.base)(r) >= 1,
        forall|c: spec_fn(R) -> nat| #[trigger] ((b.step)(c))(r) >= c(r),
    ensures
        (b.counts(k))(r) >= k + 1,
        (b.counts(k + 1))(r) > (b.counts(k))(r),
    decreases k,
{
    let last = b.counts(k);
    assert(((b.step)(last))(r) >= last(r));
    assert((b.counts(k + 1))(r) == (b.base)(r) + ((b.step)(last))(r));
    if k > 0 {
        lemma_cycle_never_converges(b, r, (k - 1) as nat);
    }
}

} // verus!
