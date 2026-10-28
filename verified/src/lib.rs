// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Synalog's graph algorithms, proved correct with [Verus](https://github.com/verus-lang/verus).
//!
//! The verifier and the compiler reason about a program's dependency graph:
//! which predicates are recursive, which recursions go through a negation,
//! which predicate cuts a mutual recursion. They map the predicates to the
//! nodes `0..n` and ask this crate, whose every function carries a
//! specification that Verus proves it meets:
//!
//!   * [`reachability`]: `r[u][v]` holds exactly when a path leads from `u`
//!     to `v`;
//!   * [`components`]: two nodes share a component exactly when each reaches
//!     the other (the strongly connected components);
//!   * [`cycles`]: the nodes on a cycle, which are exactly those of a
//!     component with two nodes or more, or with a self-loop;
//!   * [`first_negative_cycle`]: a negative edge some cycle goes through;
//!   * [`reaches_cycle`]: whether a cycle can be reached from a node;
//!   * [`plan::schedule`]: the order a compiled program's tables run in;
//!   * [`contradiction::contradictory`]: comparisons that can never all hold;
//!   * [`page::page`]: the rows a page of a predicate keeps;
//!   * [`quote`]: text quoted into SQL, read back exactly as it was;
//!   * [`cast::accepts`]: a `Cast` type name that cannot escape `CAST(...)`;
//!   * [`types::meet`]: the intersection of two types, the reference the
//!     type inference is tested against.
//!
//! `cargo verus verify` checks the proofs. A plain `cargo build` erases them
//! and compiles the code as is.

use vstd::prelude::*;

pub mod cast;
pub mod contradiction;
pub mod page;
pub mod plan;
pub mod safety;
pub mod quote;
pub mod types;

verus! {

// ---------------------------------------------------------------------------
// Specification
// ---------------------------------------------------------------------------

/// A graph over the nodes `0..g.len()`: `g[u]` lists the successors of `u`.
pub open spec fn well_formed(g: Seq<Vec<usize>>) -> bool {
    forall|u: int, k: int| 0 <= u < g.len() && 0 <= k < g[u]@.len() ==> #[trigger] g[u]@[k] < g.len()
}

pub open spec fn edge(g: Seq<Vec<usize>>, u: int, v: int) -> bool {
    0 <= u < g.len() && 0 <= v < g.len() && exists|k: int| 0 <= k < g[u]@.len() && #[trigger] g[u]@[k] as int == v
}

/// `p` walks the graph, one edge per step.
pub open spec fn is_path(g: Seq<Vec<usize>>, p: Seq<int>) -> bool {
    &&& p.len() >= 1
    &&& forall|i: int| 0 <= i < p.len() ==> 0 <= #[trigger] p[i] < g.len()
    &&& forall|i: int| 0 <= i < p.len() - 1 ==> #[trigger] edge(g, p[i], p[i + 1])
}

/// A path leads from `u` to `v` (of no edge when `u == v`).
pub open spec fn reaches(g: Seq<Vec<usize>>, u: int, v: int) -> bool {
    exists|p: Seq<int>| #[trigger] is_path(g, p) && p[0] == u && p.last() == v
}

/// `u` and `v` are in the same strongly connected component.
pub open spec fn mutual(g: Seq<Vec<usize>>, u: int, v: int) -> bool {
    reaches(g, u, v) && reaches(g, v, u)
}

/// A cycle of one edge or more goes through `v`.
pub open spec fn on_cycle(g: Seq<Vec<usize>>, v: int) -> bool {
    exists|w: int| #[trigger] edge(g, v, w) && reaches(g, w, v)
}

/// `r` is the reachability matrix of `g`.
pub open spec fn is_reachability(g: Seq<Vec<usize>>, r: Seq<Vec<bool>>) -> bool {
    &&& r.len() == g.len()
    &&& forall|u: int| 0 <= u < g.len() ==> #[trigger] r[u]@.len() == g.len()
    &&& forall|u: int, v: int| 0 <= u < g.len() && 0 <= v < g.len() ==> (#[trigger] r[u]@[v] <==> reaches(g, u, v))
}

// ---------------------------------------------------------------------------
// Lemmas on paths
// ---------------------------------------------------------------------------

proof fn lemma_step(g: Seq<Vec<usize>>, p: Seq<int>, i: int)
    requires is_path(g, p), 0 <= i < p.len() - 1,
    ensures edge(g, p[i], p[i + 1]),
{
}

proof fn lemma_reaches_refl(g: Seq<Vec<usize>>, u: int)
    requires 0 <= u < g.len(),
    ensures reaches(g, u, u),
{
    let p = seq![u];
    assert(is_path(g, p));
}

proof fn lemma_path_extend(g: Seq<Vec<usize>>, p: Seq<int>, w: int)
    requires is_path(g, p), edge(g, p.last(), w),
    ensures is_path(g, p.push(w)), p.push(w)[0] == p[0], p.push(w).last() == w,
{
    let q = p.push(w);
    assert forall|i: int| 0 <= i < q.len() - 1 implies #[trigger] edge(g, q[i], q[i + 1]) by {
        if i < p.len() - 1 {
            assert(q[i] == p[i] && q[i + 1] == p[i + 1]);
        } else {
            assert(q[i] == p.last());
        }
    }
    assert forall|i: int| 0 <= i < q.len() implies 0 <= #[trigger] q[i] < g.len() by {
        if i < p.len() {
            assert(q[i] == p[i]);
        }
    }
}

proof fn lemma_reaches_step(g: Seq<Vec<usize>>, u: int, v: int, w: int)
    requires reaches(g, u, v), edge(g, v, w),
    ensures reaches(g, u, w),
{
    let p = choose|p: Seq<int>| #[trigger] is_path(g, p) && p[0] == u && p.last() == v;
    lemma_path_extend(g, p, w);
}

proof fn lemma_reaches_edge(g: Seq<Vec<usize>>, u: int, v: int)
    requires edge(g, u, v),
    ensures reaches(g, u, v),
{
    lemma_reaches_refl(g, u);
    lemma_reaches_step(g, u, u, v);
}

proof fn lemma_reaches_trans(g: Seq<Vec<usize>>, u: int, v: int, w: int)
    requires reaches(g, u, v), reaches(g, v, w),
    ensures reaches(g, u, w),
{
    let p = choose|p: Seq<int>| #[trigger] is_path(g, p) && p[0] == u && p.last() == v;
    let q = choose|q: Seq<int>| #[trigger] is_path(g, q) && q[0] == v && q.last() == w;
    lemma_path_append(g, p, q);
}

/// Following `q` once `p` ends where `q` starts, by induction on `q`.
proof fn lemma_path_append(g: Seq<Vec<usize>>, p: Seq<int>, q: Seq<int>)
    requires is_path(g, p), is_path(g, q), p.last() == q[0],
    ensures reaches(g, p[0], q.last()),
    decreases q.len(),
{
    if q.len() == 1 {
        assert(is_path(g, p));
    } else {
        let front = q.drop_last();
        assert(is_path(g, front)) by {
            assert forall|i: int| 0 <= i < front.len() - 1 implies #[trigger] edge(g, front[i], front[i + 1]) by {
                lemma_step(g, q, i);
            }
        }
        lemma_path_append(g, p, front);
        lemma_step(g, q, q.len() - 2);
        lemma_reaches_step(g, p[0], front.last(), q.last());
    }
}

/// A path that leaves `v` for another node starts with an edge out of `v`.
proof fn lemma_first_step(g: Seq<Vec<usize>>, v: int, u: int)
    requires reaches(g, v, u), u != v,
    ensures exists|w: int| #[trigger] edge(g, v, w) && reaches(g, w, u),
{
    let p = choose|p: Seq<int>| #[trigger] is_path(g, p) && p[0] == v && p.last() == u;
    let rest = p.drop_first();
    assert(p.len() >= 2);
    lemma_step(g, p, 0);
    assert(is_path(g, rest)) by {
        assert forall|i: int| 0 <= i < rest.len() - 1 implies #[trigger] edge(g, rest[i], rest[i + 1]) by {
            lemma_step(g, p, i + 1);
        }
        assert forall|i: int| 0 <= i < rest.len() implies 0 <= #[trigger] rest[i] < g.len() by {
            assert(rest[i] == p[i + 1]);
        }
    }
    assert(rest[0] == p[1] && rest.last() == u);
    assert(edge(g, v, p[1]) && reaches(g, p[1], u));
}

/// The nodes on a cycle are those of a component with two nodes or more, or
/// with a self-loop.
pub proof fn lemma_on_cycle_iff(g: Seq<Vec<usize>>, v: int)
    requires 0 <= v < g.len(),
    ensures on_cycle(g, v) <==> (edge(g, v, v) || exists|u: int| u != v && #[trigger] mutual(g, u, v)),
{
    if on_cycle(g, v) {
        let w = choose|w: int| #[trigger] edge(g, v, w) && reaches(g, w, v);
        if w != v {
            lemma_reaches_edge(g, v, w);
            assert(mutual(g, w, v));
        }
    }
    if edge(g, v, v) {
        lemma_reaches_refl(g, v);
        assert(edge(g, v, v) && reaches(g, v, v));
    }
    if exists|u: int| u != v && #[trigger] mutual(g, u, v) {
        let u = choose|u: int| u != v && #[trigger] mutual(g, u, v);
        lemma_first_step(g, v, u);
        let w = choose|w: int| #[trigger] edge(g, v, w) && reaches(g, w, u);
        lemma_reaches_trans(g, w, u, v);
        assert(edge(g, v, w) && reaches(g, w, v));
    }
}

// ---------------------------------------------------------------------------
// Breadth-first search
// ---------------------------------------------------------------------------

/// How many nodes a search has yet to see.
pub open spec fn unseen(s: Seq<bool>) -> nat
    decreases s.len(),
{
    if s.len() == 0 {
        0
    } else {
        unseen(s.drop_last()) + if s.last() { 0nat } else { 1nat }
    }
}

pub proof fn lemma_unseen_mark(s: Seq<bool>, i: int)
    requires 0 <= i < s.len(), !s[i],
    ensures unseen(s.update(i, true)) + 1 == unseen(s),
    decreases s.len(),
{
    let t = s.update(i, true);
    if i == s.len() - 1 {
        assert(t.drop_last() =~= s.drop_last());
    } else {
        assert(t.drop_last() =~= s.drop_last().update(i, true));
        lemma_unseen_mark(s.drop_last(), i);
    }
}

/// Nothing is left unseen only once everything is seen.
pub proof fn lemma_unseen_zero(s: Seq<bool>)
    requires unseen(s) == 0,
    ensures forall|i: int| 0 <= i < s.len() ==> #[trigger] s[i],
    decreases s.len(),
{
    if s.len() > 0 {
        lemma_unseen_zero(s.drop_last());
        assert forall|i: int| 0 <= i < s.len() implies #[trigger] s[i] by {
            if i < s.len() - 1 {
                assert(s.drop_last()[i] == s[i]);
            }
        }
    }
}

pub proof fn lemma_unseen_none(s: Seq<bool>)
    requires forall|i: int| 0 <= i < s.len() ==> !#[trigger] s[i],
    ensures unseen(s) == s.len(),
    decreases s.len(),
{
    if s.len() > 0 {
        lemma_unseen_none(s.drop_last());
    }
}

/// A set closed under the edges holds the end of every path it starts.
proof fn lemma_closed(g: Seq<Vec<usize>>, seen: Seq<bool>, p: Seq<int>)
    requires
        well_formed(g),
        seen.len() == g.len(),
        is_path(g, p),
        seen[p[0]],
        forall|u: int, k: int| 0 <= u < g.len() && seen[u] && 0 <= k < g[u]@.len() ==> #[trigger] seen[g[u]@[k] as int],
    ensures seen[p.last()],
    decreases p.len(),
{
    if p.len() > 1 {
        let front = p.drop_last();
        assert(is_path(g, front)) by {
            assert forall|i: int| 0 <= i < front.len() - 1 implies #[trigger] edge(g, front[i], front[i + 1]) by {
                lemma_step(g, p, i);
            }
        }
        lemma_closed(g, seen, front);
        let i = p.len() - 2;
        let (u, v) = (p[i], p[i + 1]);
        lemma_step(g, p, i);
        assert(u == front.last() && v == p.last());
        let k = choose|k: int| 0 <= k < g[u]@.len() && #[trigger] g[u]@[k] as int == v;
        assert(seen[g[u]@[k] as int]);
    }
}

/// The nodes reachable from `s`.
pub fn reachable_from(g: &Vec<Vec<usize>>, s: usize) -> (seen: Vec<bool>)
    requires well_formed(g@), s < g.len(),
    ensures
        seen.len() == g.len(),
        forall|v: int| 0 <= v < g.len() ==> (#[trigger] seen[v] <==> reaches(g@, s as int, v)),
{
    let n = g.len();
    let mut seen: Vec<bool> = Vec::new();
    let mut i: usize = 0;
    while i < n
        invariant
            i <= n,
            seen.len() == i,
            forall|j: int| 0 <= j < i ==> !#[trigger] seen[j],
        decreases n - i,
    {
        seen.push(false);
        i += 1;
    }
    proof {
        lemma_unseen_none(seen@);
        lemma_unseen_mark(seen@, s as int);
        lemma_reaches_refl(g@, s as int);
    }
    seen.set(s, true);
    let mut order: Vec<usize> = Vec::new();
    order.push(s);
    assert(order@[0] == s);
    // `order` lists the nodes seen, `order[..head]` those whose successors are.
    let mut head: usize = 0;
    while head < order.len()
        invariant
            well_formed(g@),
            n == g.len(),
            s < n,
            seen.len() == n,
            head <= order.len(),
            order.len() + unseen(seen@) == n,
            seen[s as int],
            forall|i: int| 0 <= i < order.len() ==> #[trigger] order[i] < n && seen[order[i] as int],
            forall|v: int| 0 <= v < n && #[trigger] seen[v] ==> order@.contains(v as usize),
            forall|v: int| 0 <= v < n && #[trigger] seen[v] ==> reaches(g@, s as int, v),
            forall|i: int, k: int|
                0 <= i < head && 0 <= k < g[order[i] as int]@.len() ==> #[trigger] seen[g[order[i] as int]@[k] as int],
        decreases n - head,
    {
        let u = order[head];
        let succ = &g[u];
        let mut k: usize = 0;
        while k < succ.len()
            invariant
                well_formed(g@),
                n == g.len(),
                seen.len() == n,
                head < order.len(),
                u == order[head as int],
                u < n,
                succ == g[u as int],
                k <= succ.len(),
                order.len() + unseen(seen@) == n,
                s < n,
                seen[s as int],
                forall|i: int| 0 <= i < order.len() ==> #[trigger] order[i] < n && seen[order[i] as int],
                forall|v: int| 0 <= v < n && #[trigger] seen[v] ==> order@.contains(v as usize),
                forall|v: int| 0 <= v < n && #[trigger] seen[v] ==> reaches(g@, s as int, v),
                forall|i: int, j: int|
                    0 <= i < head && 0 <= j < g[order[i] as int]@.len() ==> #[trigger] seen[g[order[i] as int]@[j] as int],
                forall|j: int| 0 <= j < k ==> #[trigger] seen[succ@[j] as int],
            decreases succ.len() - k,
        {
            let w = succ[k];
            assert(w < n);
            if !seen[w] {
                proof {
                    lemma_unseen_mark(seen@, w as int);
                    assert(succ@[k as int] == w);
                    assert(edge(g@, u as int, w as int));
                    lemma_reaches_step(g@, s as int, u as int, w as int);
                }
                let ghost old_order = order@;
                seen.set(w, true);
                order.push(w);
                assert(order@[order.len() - 1] == w);
                assert forall|v: int| 0 <= v < n && #[trigger] seen[v] implies order@.contains(v as usize) by {
                    if v != w {
                        let i = choose|i: int| 0 <= i < old_order.len() && old_order[i] == v as usize;
                        assert(order@[i] == v as usize);
                    }
                }
            }
            k += 1;
        }
        head += 1;
    }
    proof {
        assert forall|u: int, k: int| 0 <= u < n && seen[u] && 0 <= k < g[u]@.len() implies #[trigger] seen[g[u]@[k] as int] by {
            let i = choose|i: int| 0 <= i < order.len() && order@[i] == u as usize;
            assert(order[i] as int == u);
        }
        assert forall|v: int| 0 <= v < n && reaches(g@, s as int, v) implies #[trigger] seen[v] by {
            let p = choose|p: Seq<int>| #[trigger] is_path(g@, p) && p[0] == s as int && p.last() == v;
            lemma_closed(g@, seen@, p);
        }
    }
    seen
}

// ---------------------------------------------------------------------------
// The algorithms the verifier and the compiler call
// ---------------------------------------------------------------------------

/// The reachability matrix: a search from every node.
pub fn reachability(g: &Vec<Vec<usize>>) -> (r: Vec<Vec<bool>>)
    requires well_formed(g@),
    ensures is_reachability(g@, r@),
{
    let n = g.len();
    let mut r: Vec<Vec<bool>> = Vec::new();
    let mut u: usize = 0;
    while u < n
        invariant
            well_formed(g@),
            n == g.len(),
            u <= n,
            r.len() == u,
            forall|x: int| 0 <= x < u ==> #[trigger] r[x]@.len() == n,
            forall|x: int, v: int| 0 <= x < u && 0 <= v < n ==> (#[trigger] r[x]@[v] <==> reaches(g@, x, v)),
        decreases n - u,
    {
        let seen = reachable_from(g, u);
        r.push(seen);
        assert(r[u as int]@ == seen@);
        u += 1;
    }
    r
}

/// The strongly connected components: `c[v]` is the smallest node of the
/// component of `v`, so two nodes share a component exactly when each
/// reaches the other.
pub fn components(g: &Vec<Vec<usize>>, r: &Vec<Vec<bool>>) -> (c: Vec<usize>)
    requires well_formed(g@), is_reachability(g@, r@),
    ensures
        c.len() == g.len(),
        forall|v: int| 0 <= v < g.len() ==> #[trigger] c[v] <= v && mutual(g@, c[v] as int, v),
        forall|u: int, v: int| 0 <= u < g.len() && 0 <= v < g.len() ==> (#[trigger] c[u] == #[trigger] c[v] <==> mutual(g@, u, v)),
{
    let n = g.len();
    let mut c: Vec<usize> = Vec::new();
    let mut v: usize = 0;
    while v < n
        invariant
            well_formed(g@),
            is_reachability(g@, r@),
            n == g.len(),
            v <= n,
            c.len() == v,
            forall|x: int| 0 <= x < v ==> #[trigger] c[x] <= x && mutual(g@, c[x] as int, x),
            forall|x: int, y: int| 0 <= x < v && 0 <= y < c[x] ==> !#[trigger] mutual(g@, y, x),
        decreases n - v,
    {
        let mut u: usize = 0;
        while u < v && !(r[u][v] && r[v][u])
            invariant
                is_reachability(g@, r@),
                n == g.len(),
                v < n,
                u <= v,
                forall|y: int| 0 <= y < u ==> !#[trigger] mutual(g@, y, v as int),
            decreases v - u,
        {
            u += 1;
        }
        proof {
            if u == v {
                lemma_reaches_refl(g@, v as int);
            }
        }
        c.push(u);
        assert(c[v as int] == u);
        v += 1;
    }
    proof {
        assert forall|x: int, y: int| 0 <= x < n && 0 <= y < n implies (#[trigger] c[x] == #[trigger] c[y] <==> mutual(g@, x, y)) by {
            let a = c[x] as int;
            let b = c[y] as int;
            if mutual(g@, x, y) {
                lemma_reaches_trans(g@, a, x, y);
                lemma_reaches_trans(g@, y, x, a);
                assert(mutual(g@, a, y));
                lemma_reaches_trans(g@, b, y, x);
                lemma_reaches_trans(g@, x, y, b);
                assert(mutual(g@, b, x));
            }
            if a == b {
                lemma_reaches_trans(g@, x, a, y);
                lemma_reaches_trans(g@, y, a, x);
            }
        }
    }
    c
}

/// The nodes on a cycle: `c[v]` holds when an edge leaves `v` for a node
/// that reaches back, that is when the component of `v` has another node or
/// `v` has a self-loop.
pub fn cycles(g: &Vec<Vec<usize>>, r: &Vec<Vec<bool>>) -> (c: Vec<bool>)
    requires well_formed(g@), is_reachability(g@, r@),
    ensures
        c.len() == g.len(),
        forall|v: int| 0 <= v < g.len() ==> (#[trigger] c[v] <==> on_cycle(g@, v)),
        forall|v: int| 0 <= v < g.len() ==> (#[trigger] c[v] <==> (edge(g@, v, v) || exists|u: int| u != v && #[trigger] mutual(g@, u, v))),
{
    let n = g.len();
    let mut c: Vec<bool> = Vec::new();
    let mut v: usize = 0;
    while v < n
        invariant
            well_formed(g@),
            is_reachability(g@, r@),
            n == g.len(),
            v <= n,
            c.len() == v,
            forall|x: int| 0 <= x < v ==> (#[trigger] c[x] <==> on_cycle(g@, x)),
        decreases n - v,
    {
        let succ = &g[v];
        let mut found = false;
        let mut k: usize = 0;
        while k < succ.len()
            invariant
                well_formed(g@),
                is_reachability(g@, r@),
                n == g.len(),
                v < n,
                succ == g[v as int],
                k <= succ.len(),
                found <==> exists|j: int| 0 <= j < k && #[trigger] r[succ@[j] as int]@[v as int],
            decreases succ.len() - k,
        {
            let w = succ[k];
            if r[w][v] {
                found = true;
            }
            k += 1;
        }
        proof {
            if found {
                let j = choose|j: int| 0 <= j < succ.len() && #[trigger] r[succ@[j] as int]@[v as int];
                let w = succ@[j] as int;
                assert(edge(g@, v as int, w));
            }
            if on_cycle(g@, v as int) {
                let w = choose|w: int| #[trigger] edge(g@, v as int, w) && reaches(g@, w, v as int);
                let j = choose|j: int| 0 <= j < succ.len() && #[trigger] succ@[j] as int == w;
                assert(r[succ@[j] as int]@[v as int]);
            }
        }
        c.push(found);
        assert(c[v as int] == found);
        v += 1;
    }
    proof {
        assert forall|v: int| 0 <= v < n implies (#[trigger] c[v] <==> (edge(g@, v, v) || exists|u: int| u != v && #[trigger] mutual(g@, u, v))) by {
            lemma_on_cycle_iff(g@, v);
        }
    }
    c
}

/// The first of `edges` (negative dependencies, say) some cycle goes
/// through: an edge `(u, v)` is on a cycle exactly when `v` reaches `u`.
// `g` only appears in the specification, which a plain build erases.
#[allow(unused_variables)]
pub fn first_negative_cycle(g: &Vec<Vec<usize>>, r: &Vec<Vec<bool>>, edges: &Vec<(usize, usize)>) -> (found: Option<usize>)
    requires
        well_formed(g@),
        is_reachability(g@, r@),
        forall|i: int| 0 <= i < edges.len() ==> #[trigger] edges[i].0 < g.len() && edges[i].1 < g.len(),
    ensures
        match found {
            Some(i) => i < edges.len() && reaches(g@, edges[i as int].1 as int, edges[i as int].0 as int),
            None => forall|i: int| 0 <= i < edges.len() ==> !reaches(g@, #[trigger] edges[i].1 as int, edges[i].0 as int),
        },
{
    let mut i: usize = 0;
    while i < edges.len()
        invariant
            is_reachability(g@, r@),
            forall|j: int| 0 <= j < edges.len() ==> #[trigger] edges[j].0 < g.len() && edges[j].1 < g.len(),
            i <= edges.len(),
            forall|j: int| 0 <= j < i ==> !reaches(g@, #[trigger] edges[j].1 as int, edges[j].0 as int),
        decreases edges.len() - i,
    {
        let (u, v) = edges[i];
        if r[v][u] {
            return Some(i);
        }
        i += 1;
    }
    None
}

/// Whether a cycle can be reached from `p`.
// `g` only appears in the specification, which a plain build erases.
#[allow(unused_variables)]
pub fn reaches_cycle(g: &Vec<Vec<usize>>, r: &Vec<Vec<bool>>, on: &Vec<bool>, p: usize) -> (b: bool)
    requires
        well_formed(g@),
        is_reachability(g@, r@),
        on.len() == g.len(),
        forall|v: int| 0 <= v < g.len() ==> (#[trigger] on[v] <==> on_cycle(g@, v)),
        p < g.len(),
    ensures b <==> exists|v: int| 0 <= v < g.len() && #[trigger] reaches(g@, p as int, v) && on_cycle(g@, v),
{
    let n = g.len();
    let mut v: usize = 0;
    while v < n
        invariant
            is_reachability(g@, r@),
            on.len() == n,
            forall|x: int| 0 <= x < n ==> (#[trigger] on[x] <==> on_cycle(g@, x)),
            n == g.len(),
            p < n,
            v <= n,
            forall|x: int| 0 <= x < v ==> !(#[trigger] reaches(g@, p as int, x) && on_cycle(g@, x)),
        decreases n - v,
    {
        if r[p][v] && on[v] {
            return true;
        }
        v += 1;
    }
    false
}

} // verus!
