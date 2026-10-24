// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The order a compiled program's tables run in, with its `@Iteration` loops.
//!
//! The tables are the nodes `0..n`, in the compiler's order. A table may
//! belong to an iteration: a plain one runs its tables once, then again in a
//! loop; a semi-naive one runs its tables only inside its loop. [`schedule`]
//! plans a step at a time the first table that can run, and Verus proves the
//! plan it returns:
//!
//!   * runs every table, and none twice;
//!   * runs a table after every table it requires, a table of a semi-naive
//!     loop in that same loop excepted;
//!   * runs a table that requires one of another iteration after that
//!     iteration's loop;
//!   * loops a plain iteration once, after all its tables ran.
//!
//! When no table can run (a cycle the dependencies do not resolve), it
//! returns `None`.

use vstd::prelude::*;

// Proofs only: a plain build erases them.
#[cfg(verus_keep_ghost)]
use crate::{lemma_unseen_mark, lemma_unseen_none, lemma_unseen_zero, unseen};

verus! {

/// One step of a plan.
pub enum Step {
    /// Run a table.
    Table(usize),
    /// Loop an iteration: a semi-naive one runs its tables in it.
    Loop(usize),
}

/// The tables to plan.
pub struct PlanGraph {
    /// The tables each table requires.
    pub requires: Vec<Vec<usize>>,
    /// The iteration each table belongs to.
    pub iteration_of: Vec<Option<usize>>,
    /// The tables each iteration loops.
    pub members: Vec<Vec<usize>>,
    /// Whether each iteration is semi-naive.
    pub semi_naive: Vec<bool>,
}

pub open spec fn has(v: Seq<usize>, x: int) -> bool {
    exists|k: int| 0 <= k < v.len() && #[trigger] v[k] as int == x
}

pub open spec fn is_loop(step: Step, i: int) -> bool {
    match step {
        Step::Loop(a) => a as int == i,
        Step::Table(_) => false,
    }
}

impl PlanGraph {
    pub open spec fn n(&self) -> int {
        self.requires@.len() as int
    }

    pub open spec fn m(&self) -> int {
        self.members@.len() as int
    }

    pub open spec fn well_formed(&self) -> bool {
        &&& self.iteration_of@.len() == self.n()
        &&& self.semi_naive@.len() == self.m()
        &&& forall|t: int, k: int|
            0 <= t < self.n() && 0 <= k < self.requires@[t]@.len() ==> #[trigger] self.requires@[t]@[k] < self.n()
        &&& forall|i: int, k: int|
            0 <= i < self.m() && 0 <= k < self.members@[i]@.len() ==> #[trigger] self.members@[i]@[k] < self.n()
        &&& forall|t: int| 0 <= t < self.n() ==> match #[trigger] self.iteration_of@[t] {
            Some(i) => i < self.m(),
            None => true,
        }
    }

    /// `t` belongs to the iteration `i`.
    pub open spec fn iteration_is(&self, t: int, i: int) -> bool {
        match self.iteration_of@[t] {
            Some(a) => a as int == i,
            None => false,
        }
    }

    /// `t` runs in the loop of the semi-naive iteration `i`.
    pub open spec fn in_loop(&self, i: int, t: int) -> bool {
        &&& 0 <= i < self.m()
        &&& self.semi_naive@[i]
        &&& self.iteration_is(t, i)
        &&& has(self.members@[i]@, t)
    }

    /// `step` runs `t`.
    pub open spec fn covers(&self, step: Step, t: int) -> bool {
        match step {
            Step::Table(x) => x as int == t,
            Step::Loop(i) => self.in_loop(i as int, t),
        }
    }

    /// A step of `s` ran `t`.
    pub open spec fn done_before(&self, s: Seq<Step>, t: int) -> bool {
        exists|j: int| 0 <= j < s.len() && #[trigger] self.covers(s[j], t)
    }

    pub open spec fn looped_before(s: Seq<Step>, i: int) -> bool {
        exists|j: int| 0 <= j < s.len() && #[trigger] is_loop(s[j], i)
    }

    /// `t` can read `r` once the steps `s` ran: `r` ran, and when it belongs
    /// to another iteration than `t`, that iteration's loop ran too.
    pub open spec fn ready_for(&self, s: Seq<Step>, t: int, r: int) -> bool {
        &&& self.done_before(s, r)
        &&& match self.iteration_of@[r] {
            Some(a) => self.iteration_is(t, a as int) || Self::looped_before(s, a as int),
            None => true,
        }
    }

    /// `step` may follow the steps `s`.
    pub open spec fn step_ok(&self, s: Seq<Step>, step: Step) -> bool {
        &&& forall|t: int| 0 <= t < self.n() && #[trigger] self.covers(step, t) ==> !self.done_before(s, t)
        &&& forall|t: int, r: int|
            0 <= t < self.n() && self.covers(step, t) && #[trigger] has(self.requires@[t]@, r) ==> self.ready_for(s, t, r)
                || match step {
                    Step::Loop(i) => self.in_loop(i as int, r),
                    Step::Table(_) => false,
                }
        &&& match step {
            Step::Table(t) => t < self.n(),
            Step::Loop(i) => {
                &&& i < self.m()
                &&& !Self::looped_before(s, i as int)
                &&& !self.semi_naive@[i as int] ==> forall|p: int|
                    #[trigger] has(self.members@[i as int]@, p) ==> self.done_before(s, p)
            },
        }
    }

    /// Every table of the plain iteration `i` belongs to it, and it has one.
    pub open spec fn plain_iteration(&self, i: int) -> bool {
        &&& !self.semi_naive@[i]
        &&& self.members@[i]@.len() > 0
        &&& forall|p: int| #[trigger] has(self.members@[i]@, p) ==> self.iteration_is(p, i)
    }

    /// The plan `s` runs every table once and in order, and loops every
    /// plain iteration.
    pub open spec fn plan_ok(&self, s: Seq<Step>) -> bool {
        &&& forall|j: int| 0 <= j < s.len() ==> self.step_ok(s.take(j), #[trigger] s[j])
        &&& forall|t: int| 0 <= t < self.n() ==> #[trigger] self.done_before(s, t)
        &&& forall|i: int| 0 <= i < self.m() && #[trigger] self.plain_iteration(i) ==> Self::looped_before(s, i)
    }

    /// What `done` and `finished` say of the steps `s`.
    spec fn tracks(&self, s: Seq<Step>, done: Seq<bool>, finished: Seq<bool>) -> bool {
        &&& done.len() == self.n()
        &&& finished.len() == self.m()
        &&& forall|t: int| 0 <= t < self.n() ==> (#[trigger] done[t] <==> self.done_before(s, t))
        &&& forall|i: int| 0 <= i < self.m() ==> (#[trigger] finished[i] <==> Self::looped_before(s, i))
    }

    /// What `ready_for` says with `done` and `finished` for the steps.
    spec fn ready_now(&self, done: Seq<bool>, finished: Seq<bool>, t: int, r: int) -> bool {
        &&& done[r]
        &&& match self.iteration_of@[r] {
            Some(a) => self.iteration_is(t, a as int) || finished[a as int],
            None => true,
        }
    }
}

proof fn lemma_push(g: &PlanGraph, s: Seq<Step>, x: Step)
    ensures
        forall|t: int| #[trigger] g.done_before(s.push(x), t) <==> (g.done_before(s, t) || g.covers(x, t)),
        forall|i: int| #[trigger] PlanGraph::looped_before(s.push(x), i) <==> (PlanGraph::looped_before(s, i) || is_loop(x, i)),
        forall|j: int| 0 <= j <= s.len() ==> #[trigger] s.push(x).take(j) == s.take(j),
        s.take(s.len() as int) == s,
{
    let q = s.push(x);
    assert forall|t: int| #[trigger] g.done_before(q, t) <==> (g.done_before(s, t) || g.covers(x, t)) by {
        if g.done_before(q, t) {
            let j = choose|j: int| 0 <= j < q.len() && #[trigger] g.covers(q[j], t);
            if j < s.len() {
                assert(q[j] == s[j]);
            }
        }
        if g.done_before(s, t) {
            let j = choose|j: int| 0 <= j < s.len() && #[trigger] g.covers(s[j], t);
            assert(q[j] == s[j]);
        }
        if g.covers(x, t) {
            assert(q[s.len() as int] == x);
        }
    }
    assert forall|i: int| #[trigger] PlanGraph::looped_before(q, i) <==> (PlanGraph::looped_before(s, i) || is_loop(x, i)) by {
        if PlanGraph::looped_before(q, i) {
            let j = choose|j: int| 0 <= j < q.len() && #[trigger] is_loop(q[j], i);
            if j < s.len() {
                assert(q[j] == s[j]);
            }
        }
        if PlanGraph::looped_before(s, i) {
            let j = choose|j: int| 0 <= j < s.len() && #[trigger] is_loop(s[j], i);
            assert(q[j] == s[j]);
        }
        if is_loop(x, i) {
            assert(q[s.len() as int] == x);
        }
    }
    assert forall|j: int| 0 <= j <= s.len() implies #[trigger] q.take(j) == s.take(j) by {
        assert(q.take(j) =~= s.take(j));
    }
    assert(s.take(s.len() as int) =~= s);
}

fn contains(v: &Vec<usize>, x: usize) -> (b: bool)
    ensures b <==> has(v@, x as int),
{
    let mut k: usize = 0;
    while k < v.len()
        invariant
            k <= v.len(),
            forall|j: int| 0 <= j < k ==> #[trigger] v@[j] != x,
        decreases v.len() - k,
    {
        if v[k] == x {
            return true;
        }
        k += 1;
    }
    proof {
        if has(v@, x as int) {
            let j = choose|j: int| 0 <= j < v@.len() && #[trigger] v@[j] as int == x as int;
            assert(v@[j] == x);
        }
    }
    false
}

/// The semi-naive iteration `t` runs in the loop of, if any.
fn loop_of(g: &PlanGraph, t: usize) -> (l: Option<usize>)
    requires g.well_formed(), t < g.n(),
    ensures
        match l {
            Some(i) => g.in_loop(i as int, t as int),
            None => forall|i: int| !#[trigger] g.in_loop(i, t as int),
        },
{
    assert(match g.iteration_of@[t as int] { Some(i) => i < g.m(), None => true });
    match g.iteration_of[t] {
        Some(i) => {
            if g.semi_naive[i] && contains(&g.members[i], t) {
                Some(i)
            } else {
                None
            }
        },
        None => None,
    }
}

fn ready_now(g: &PlanGraph, done: &Vec<bool>, finished: &Vec<bool>, t: usize, r: usize) -> (b: bool)
    requires g.well_formed(), t < g.n(), r < g.n(), done.len() == g.n(), finished.len() == g.m(),
    ensures b <==> g.ready_now(done@, finished@, t as int, r as int),
{
    assert(match g.iteration_of@[r as int] { Some(i) => i < g.m(), None => true });
    if !done[r] {
        return false;
    }
    match g.iteration_of[r] {
        Some(a) => match g.iteration_of[t] {
            Some(b) => a == b || finished[a],
            None => finished[a],
        },
        None => true,
    }
}

/// Every table `t` requires is ready for it.
fn table_ready(g: &PlanGraph, done: &Vec<bool>, finished: &Vec<bool>, t: usize) -> (b: bool)
    requires g.well_formed(), t < g.n(), done.len() == g.n(), finished.len() == g.m(),
    ensures b ==> forall|r: int| #[trigger] has(g.requires@[t as int]@, r) ==> g.ready_now(done@, finished@, t as int, r),
{
    let reqs = &g.requires[t];
    let mut k: usize = 0;
    while k < reqs.len()
        invariant
            g.well_formed(),
            t < g.n(),
            done.len() == g.n(),
            finished.len() == g.m(),
            reqs == g.requires@[t as int],
            k <= reqs.len(),
            forall|j: int| 0 <= j < k ==> #[trigger] g.ready_now(done@, finished@, t as int, reqs@[j] as int),
        decreases reqs.len() - k,
    {
        assert(reqs@[k as int] < g.n());
        if !ready_now(g, done, finished, t, reqs[k]) {
            return false;
        }
        k += 1;
    }
    proof {
        assert forall|r: int| #[trigger] has(g.requires@[t as int]@, r) implies g.ready_now(done@, finished@, t as int, r) by {
            let j = choose|j: int| 0 <= j < reqs@.len() && #[trigger] reqs@[j] as int == r;
            assert(g.ready_now(done@, finished@, t as int, reqs@[j] as int));
        }
    }
    true
}

/// Every table a table of the loop of `i` requires is in the loop, or ready.
fn loop_ready(g: &PlanGraph, done: &Vec<bool>, finished: &Vec<bool>, i: usize) -> (b: bool)
    requires g.well_formed(), i < g.m(), g.semi_naive@[i as int], done.len() == g.n(), finished.len() == g.m(),
    ensures
        b ==> forall|p: int, r: int|
            g.in_loop(i as int, p) && #[trigger] has(g.requires@[p]@, r) ==> g.in_loop(i as int, r) || g.ready_now(done@, finished@, p, r),
{
    let members = &g.members[i];
    let mut k: usize = 0;
    while k < members.len()
        invariant
            g.well_formed(),
            i < g.m(),
            g.semi_naive@[i as int],
            done.len() == g.n(),
            finished.len() == g.m(),
            members == g.members@[i as int],
            k <= members.len(),
            forall|j: int, r: int|
                0 <= j < k && g.iteration_is(members@[j] as int, i as int) && #[trigger] has(g.requires@[members@[j] as int]@, r)
                    ==> g.in_loop(i as int, r) || g.ready_now(done@, finished@, members@[j] as int, r),
        decreases members.len() - k,
    {
        let p = members[k];
        assert(p < g.n());
        let in_iteration = match g.iteration_of[p] {
            Some(a) => a == i,
            None => false,
        };
        if in_iteration {
            let reqs = &g.requires[p];
            let mut l: usize = 0;
            while l < reqs.len()
                invariant
                    g.well_formed(),
                    i < g.m(),
                    g.semi_naive@[i as int],
                    done.len() == g.n(),
                    finished.len() == g.m(),
                    p < g.n(),
                    members == g.members@[i as int],
                    reqs == g.requires@[p as int],
                    l <= reqs.len(),
                    forall|j: int| 0 <= j < l ==> g.in_loop(i as int, #[trigger] reqs@[j] as int)
                        || g.ready_now(done@, finished@, p as int, reqs@[j] as int),
                decreases reqs.len() - l,
            {
                let r = reqs[l];
                assert(r < g.n());
                assert(match g.iteration_of@[r as int] { Some(a) => a < g.m(), None => true });
                let mut r_in_loop = false;
                if let Some(a) = g.iteration_of[r] {
                    if a == i && contains(members, r) {
                        assert(g.iteration_is(r as int, i as int));
                        assert(has(g.members@[i as int]@, r as int));
                        r_in_loop = true;
                    }
                }
                if !r_in_loop && !ready_now(g, done, finished, p, r) {
                    return false;
                }
                assert(reqs@[l as int] == r);
                l += 1;
            }
            proof {
                assert forall|r: int| #[trigger] has(g.requires@[p as int]@, r) implies g.in_loop(i as int, r)
                    || g.ready_now(done@, finished@, p as int, r) by {
                    let j = choose|j: int| 0 <= j < reqs@.len() && #[trigger] reqs@[j] as int == r;
                    assert(g.in_loop(i as int, reqs@[j] as int) || g.ready_now(done@, finished@, p as int, reqs@[j] as int));
                }
            }
        }
        k += 1;
    }
    proof {
        assert forall|p: int, r: int| g.in_loop(i as int, p) && #[trigger] has(g.requires@[p]@, r) implies g.in_loop(i as int, r)
            || g.ready_now(done@, finished@, p, r) by {
            let j = choose|j: int| 0 <= j < members@.len() && #[trigger] members@[j] as int == p;
            assert(has(g.requires@[members@[j] as int]@, r));
        }
    }
    true
}

/// Every table of the iteration `i` ran.
fn all_done(g: &PlanGraph, done: &Vec<bool>, i: usize) -> (b: bool)
    requires g.well_formed(), i < g.m(), done.len() == g.n(),
    ensures b <==> forall|p: int| #[trigger] has(g.members@[i as int]@, p) ==> done@[p],
{
    let members = &g.members[i];
    let mut k: usize = 0;
    while k < members.len()
        invariant
            g.well_formed(),
            i < g.m(),
            done.len() == g.n(),
            members == g.members@[i as int],
            k <= members.len(),
            forall|j: int| 0 <= j < k ==> done@[#[trigger] members@[j] as int],
        decreases members.len() - k,
    {
        assert(members@[k as int] < g.n());
        if !done[members[k]] {
            assert(has(g.members@[i as int]@, members@[k as int] as int));
            return false;
        }
        k += 1;
    }
    proof {
        assert forall|p: int| #[trigger] has(g.members@[i as int]@, p) implies done@[p] by {
            let j = choose|j: int| 0 <= j < members@.len() && #[trigger] members@[j] as int == p;
            assert(done@[members@[j] as int]);
        }
    }
    true
}

/// Plan the tables: each step runs the first table that can run, or loops
/// its semi-naive iteration; a plain iteration loops once its last table ran.
pub fn schedule(g: &PlanGraph) -> (plan: Option<Vec<Step>>)
    requires g.well_formed(),
    ensures
        match plan {
            Some(s) => g.plan_ok(s@),
            None => true,
        },
{
    let n = g.requires.len();
    let m = g.members.len();
    let mut done: Vec<bool> = Vec::new();
    while done.len() < n
        invariant
            done.len() <= n,
            forall|j: int| 0 <= j < done.len() ==> !#[trigger] done@[j],
        decreases n - done.len(),
    {
        done.push(false);
    }
    let mut finished: Vec<bool> = Vec::new();
    while finished.len() < m
        invariant
            finished.len() <= m,
            forall|j: int| 0 <= j < finished.len() ==> !#[trigger] finished@[j],
        decreases m - finished.len(),
    {
        finished.push(false);
    }
    let mut steps: Vec<Step> = Vec::new();
    let mut remaining: usize = n;
    proof {
        lemma_unseen_none(done@);
        assert forall|i: int| 0 <= i < m && #[trigger] g.plain_iteration(i) && (forall|p: int| #[trigger] has(g.members@[i]@, p) ==> done@[p])
            implies finished@[i] by {
            assert(has(g.members@[i]@, g.members@[i]@[0] as int));
        }
    }
    while remaining > 0
        invariant
            g.well_formed(),
            n == g.n(),
            m == g.m(),
            g.tracks(steps@, done@, finished@),
            remaining == unseen(done@),
            forall|j: int| 0 <= j < steps@.len() ==> g.step_ok(steps@.take(j), #[trigger] steps@[j]),
            // A semi-naive loop runs all its tables at once.
            forall|i: int, t: int| 0 <= t < n && #[trigger] g.in_loop(i, t) ==> (done@[t] <==> finished@[i]),
            forall|i: int| 0 <= i < m && #[trigger] g.plain_iteration(i) && (forall|p: int| #[trigger] has(g.members@[i]@, p) ==> done@[p])
                ==> finished@[i],
        decreases remaining,
    {
        // The first table that can run.
        let mut t: usize = 0;
        let mut found = false;
        let mut lp: Option<usize> = None;
        while !found && t < n
            invariant
                g.well_formed(),
                n == g.n(),
                m == g.m(),
                done.len() == n,
                finished.len() == m,
                t <= n,
                found ==> t < n && !done@[t as int] && match lp {
                    Some(i) => g.in_loop(i as int, t as int) && forall|p: int, r: int|
                        g.in_loop(i as int, p) && #[trigger] has(g.requires@[p]@, r) ==> g.in_loop(i as int, r)
                            || g.ready_now(done@, finished@, p, r),
                    None => (forall|i: int| !#[trigger] g.in_loop(i, t as int)) && forall|r: int|
                        #[trigger] has(g.requires@[t as int]@, r) ==> g.ready_now(done@, finished@, t as int, r),
                },
            decreases n - t + if found { 0int } else { 1int },
        {
            if !done[t] {
                lp = loop_of(g, t);
                found = match lp {
                    Some(i) => loop_ready(g, &done, &finished, i),
                    None => table_ready(g, &done, &finished, t),
                };
            }
            if !found {
                t += 1;
            }
        }
        if !found {
            // A cycle the dependencies do not resolve.
            return None;
        }
        let ghost s0 = steps@;
        let ghost done0 = done@;
        let ghost finished0 = finished@;
        match lp {
            None => {
                let x = Step::Table(t);
                proof {
                    assert(g.step_ok(s0, x)) by {
                        assert forall|u: int, r: int| 0 <= u < n && g.covers(x, u) && #[trigger] has(g.requires@[u]@, r)
                            implies g.ready_for(s0, u, r) by {
                            assert(g.ready_now(done0, finished0, t as int, r));
                            assert(r < n) by {
                                let k = choose|k: int| 0 <= k < g.requires@[u]@.len() && #[trigger] g.requires@[u]@[k] as int == r;
                            }
                        }
                    }
                    lemma_push(g, s0, x);
                    lemma_unseen_mark(done@, t as int);
                }
                steps.push(x);
                done.set(t, true);
                remaining -= 1;
                assert(g.tracks(steps@, done@, finished@));
                assert(match g.iteration_of@[t as int] { Some(i) => i < m, None => true });
                // A plain iteration loops once its last table ran.
                if let Some(i) = g.iteration_of[t] {
                    if !g.semi_naive[i] && !finished[i] && all_done(g, &done, i) {
                        let y = Step::Loop(i);
                        let ghost s1 = steps@;
                        proof {
                            assert forall|p: int| #[trigger] has(g.members@[i as int]@, p) implies g.done_before(s1, p) by {
                                assert(p < n) by {
                                    let k = choose|k: int| 0 <= k < g.members@[i as int]@.len() && #[trigger] g.members@[i as int]@[k] as int == p;
                                }
                            }
                            assert(g.step_ok(s1, y));
                            lemma_push(g, s1, y);
                        }
                        steps.push(y);
                        finished.set(i, true);
                    }
                }
                proof {
                    assert forall|j: int| 0 <= j < steps@.len() implies g.step_ok(steps@.take(j), #[trigger] steps@[j]) by {
                        if j < s0.len() {
                            assert(steps@.take(j) == s0.take(j));
                            assert(steps@[j] == s0[j]);
                        }
                    }
                    assert forall|i: int| 0 <= i < m && #[trigger] g.plain_iteration(i) && (forall|p: int| #[trigger] has(g.members@[i]@, p) ==> done@[p])
                        implies finished@[i] by {
                        if !(forall|p: int| #[trigger] has(g.members@[i]@, p) ==> done0[p]) {
                            let p = choose|p: int| #[trigger] has(g.members@[i]@, p) && !done0[p];
                            assert(p == t);
                        }
                    }
                }
            },
            Some(i) => {
                let x = Step::Loop(i);
                proof {
                    assert(!finished0[i as int]);
                    assert(g.step_ok(s0, x)) by {
                        assert forall|u: int| 0 <= u < n && #[trigger] g.covers(x, u) implies !g.done_before(s0, u) by {
                            assert(g.in_loop(i as int, u));
                        }
                        assert forall|u: int, r: int| 0 <= u < n && g.covers(x, u) && #[trigger] has(g.requires@[u]@, r)
                            implies g.ready_for(s0, u, r) || g.in_loop(i as int, r) by {
                            if !g.in_loop(i as int, r) {
                                assert(g.ready_now(done0, finished0, u, r));
                                assert(r < n) by {
                                    let k = choose|k: int| 0 <= k < g.requires@[u]@.len() && #[trigger] g.requires@[u]@[k] as int == r;
                                }
                            }
                        }
                    }
                    lemma_push(g, s0, x);
                }
                steps.push(x);
                finished.set(i, true);
                // Run the loop's tables.
                let members = &g.members[i];
                let mut k: usize = 0;
                let ghost mut marked: int = 0;
                while k < members.len()
                    invariant
                        g.well_formed(),
                        n == g.n(),
                        m == g.m(),
                        i < m,
                        members == g.members@[i as int],
                        k <= members.len(),
                        done.len() == n,
                        marked >= 0,
                        remaining + marked == unseen(done0),
                        remaining == unseen(done@),
                        marked == 0 ==> done@ == done0,
                        forall|u: int| 0 <= u < n ==> (#[trigger] done@[u] <==> done0[u] || (g.iteration_is(u, i as int)
                            && exists|j: int| 0 <= j < k && #[trigger] members@[j] as int == u)),
                    decreases members.len() - k,
                {
                    let p = members[k];
                    assert(p < n);
                    let in_iteration = match g.iteration_of[p] {
                        Some(a) => a == i,
                        None => false,
                    };
                    if in_iteration && !done[p] {
                        proof {
                            lemma_unseen_mark(done@, p as int);
                        }
                        done.set(p, true);
                        remaining -= 1;
                        proof {
                            marked = marked + 1;
                        }
                    }
                    proof {
                        assert forall|u: int| 0 <= u < n implies (#[trigger] done@[u] <==> done0[u] || (g.iteration_is(u, i as int)
                            && exists|j: int| 0 <= j < k + 1 && #[trigger] members@[j] as int == u)) by {
                            if u == p as int && g.iteration_is(u, i as int) {
                                assert(members@[k as int] as int == u);
                            }
                            if exists|j: int| 0 <= j < k + 1 && #[trigger] members@[j] as int == u {
                                let j = choose|j: int| 0 <= j < k + 1 && #[trigger] members@[j] as int == u;
                                if j < k {
                                    assert(exists|j: int| 0 <= j < k && #[trigger] members@[j] as int == u);
                                }
                            }
                        }
                    }
                    k += 1;
                }
                proof {
                    // The loop's tables are now those that ran.
                    assert forall|u: int| 0 <= u < n implies (#[trigger] done@[u] <==> done0[u] || g.in_loop(i as int, u)) by {
                        if g.in_loop(i as int, u) {
                            let j = choose|j: int| 0 <= j < members@.len() && #[trigger] members@[j] as int == u;
                        }
                    }
                    // `t` ran: the loop made progress.
                    assert(done@[t as int] && !done0[t as int]);
                    assert(marked > 0);
                    assert(g.tracks(steps@, done@, finished@));
                    assert forall|j: int| 0 <= j < steps@.len() implies g.step_ok(steps@.take(j), #[trigger] steps@[j]) by {
                        if j < s0.len() {
                            assert(steps@.take(j) == s0.take(j));
                            assert(steps@[j] == s0[j]);
                        }
                    }
                    assert forall|i2: int, u: int| 0 <= u < n && #[trigger] g.in_loop(i2, u) implies (done@[u] <==> finished@[i2]) by {
                        if i2 != i as int {
                            assert(!g.in_loop(i as int, u));
                        }
                    }
                    assert forall|i2: int| 0 <= i2 < m && #[trigger] g.plain_iteration(i2) && (forall|p: int| #[trigger] has(g.members@[i2]@, p) ==> done@[p])
                        implies finished@[i2] by {
                        assert forall|p: int| #[trigger] has(g.members@[i2]@, p) implies done0[p] by {
                            assert(g.iteration_is(p, i2));
                            if g.in_loop(i as int, p) {
                                assert(i2 == i as int);
                            }
                        }
                    }
                }
            },
        }
    }
    proof {
        lemma_unseen_zero(done@);
        assert forall|t: int| 0 <= t < n implies #[trigger] g.done_before(steps@, t) by {
            assert(done@[t]);
        }
        assert forall|i: int| 0 <= i < m && #[trigger] g.plain_iteration(i) implies PlanGraph::looped_before(steps@, i) by {
            assert forall|p: int| #[trigger] has(g.members@[i]@, p) implies done@[p] by {
                let k = choose|k: int| 0 <= k < g.members@[i]@.len() && #[trigger] g.members@[i]@[k] as int == p;
                assert(g.members@[i]@[k] < n);
            }
        }
    }
    Some(steps)
}

} // verus!
