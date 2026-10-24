// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Comparisons that can never all hold.
//!
//! A rule's comparisons between its variables and constants are the nodes
//! `0..n`, and constraints between them: `a < b` or `a <= b` (an `edges`
//! entry, strict or not) and `a != b` (a `differ` entry). The constants'
//! own order is a set of edges among them. [`contradictory`] closes the
//! order (Floyd-Warshall) and reports a strict cycle, or two nodes that must
//! differ but cannot. Verus proves it sound: when it reports, no values
//! satisfy the constraints, so a rule it warns about indeed gives no row.
//!
//! The values are integers: values of any other order (numbers, strings)
//! that satisfied the constraints would give integers that do, each value's
//! rank among the finitely many there are.

use vstd::prelude::*;

verus! {

pub open spec fn holds(strict: bool, a: int, b: int) -> bool {
    if strict { a < b } else { a <= b }
}

/// The values `val` of the nodes satisfy the constraints.
pub open spec fn satisfies(val: Seq<int>, edges: Seq<(usize, usize, bool)>, differ: Seq<(usize, usize)>) -> bool {
    &&& forall|k: int| 0 <= k < edges.len() ==> holds(#[trigger] edges[k].2, val[edges[k].0 as int], val[edges[k].1 as int])
    &&& forall|k: int| 0 <= k < differ.len() ==> val[#[trigger] differ[k].0 as int] != val[differ[k].1 as int]
}

/// What `reach` says of two nodes holds of the values `val`.
pub open spec fn consistent(reach: Seq<Vec<Option<bool>>>, val: Seq<int>, n: int) -> bool {
    forall|i: int, j: int| 0 <= i < n && 0 <= j < n ==> match #[trigger] reach[i]@[j] {
        Some(s) => holds(s, val[i], val[j]),
        None => true,
    }
}

pub open spec fn square(reach: Seq<Vec<Option<bool>>>, n: int) -> bool {
    &&& reach.len() == n
    &&& forall|i: int| 0 <= i < n ==> #[trigger] reach[i]@.len() == n
}

/// What `reach` says of `i` and `j` once a constraint `strict` between them
/// is added: `i < j` when one of them is strict.
fn combine(cur: Option<bool>, strict: bool) -> (r: Option<bool>)
    ensures
        r.is_some(),
        forall|a: int, b: int| holds(strict, a, b) && (match cur { Some(c) => holds(c, a, b), None => true })
            ==> #[trigger] holds(r.unwrap(), a, b),
{
    match cur {
        Some(c) => Some(c || strict),
        None => Some(strict),
    }
}

/// Set `reach[i][j]` to `v`.
fn update(reach: &mut Vec<Vec<Option<bool>>>, i: usize, j: usize, v: Option<bool>, Ghost(n): Ghost<int>)
    requires square(old(reach)@, n), i < n, j < n,
    ensures
        square(final(reach)@, n),
        forall|x: int, y: int| 0 <= x < n && 0 <= y < n ==> #[trigger] final(reach)@[x]@[y] == if x == i && y == j {
            v
        } else {
            old(reach)@[x]@[y]
        },
{
    let mut row: Vec<Option<bool>> = Vec::new();
    reach.set_and_swap(i, &mut row);
    row.set(j, v);
    reach.set_and_swap(i, &mut row);
}

/// Whether the constraints can never all hold.
pub fn contradictory(n: usize, edges: &Vec<(usize, usize, bool)>, differ: &Vec<(usize, usize)>) -> (b: bool)
    requires
        forall|k: int| 0 <= k < edges.len() ==> #[trigger] edges[k].0 < n && edges[k].1 < n,
        forall|k: int| 0 <= k < differ.len() ==> #[trigger] differ[k].0 < n && differ[k].1 < n,
    ensures b ==> forall|val: Seq<int>| val.len() == n ==> !#[trigger] satisfies(val, edges@, differ@),
{
    // reach[i][j]: None, Some(false) for i <= j, Some(true) for i < j.
    let mut reach: Vec<Vec<Option<bool>>> = Vec::new();
    while reach.len() < n
        invariant
            reach.len() <= n,
            forall|i: int| 0 <= i < reach.len() ==> #[trigger] reach@[i]@.len() == n,
            forall|i: int, j: int| 0 <= i < reach.len() && 0 <= j < n ==> #[trigger] reach@[i]@[j] == None::<bool>,
        decreases n - reach.len(),
    {
        let mut row: Vec<Option<bool>> = Vec::new();
        while row.len() < n
            invariant
                row.len() <= n,
                forall|j: int| 0 <= j < row.len() ==> #[trigger] row@[j] == None::<bool>,
            decreases n - row.len(),
        {
            row.push(None);
        }
        reach.push(row);
    }

    let mut k: usize = 0;
    while k < edges.len()
        invariant
            square(reach@, n as int),
            forall|e: int| 0 <= e < edges.len() ==> #[trigger] edges[e].0 < n && edges[e].1 < n,
            k <= edges.len(),
            forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
        decreases edges.len() - k,
    {
        let (i, j, strict) = edges[k];
        let v = combine(reach[i][j], strict);
        let ghost before = reach@;
        update(&mut reach, i, j, v, Ghost(n as int));
        assert forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) implies consistent(reach@, val, n as int) by {
            assert(consistent(before, val, n as int));
            assert(holds(edges@[k as int].2, val[i as int], val[j as int]));
            assert(holds(v.unwrap(), val[i as int], val[j as int]));
        }
        k += 1;
    }

    // Close the order: i < k <= j gives i < j, i <= k <= j gives i <= j.
    let mut m: usize = 0;
    while m < n
        invariant
            square(reach@, n as int),
            m <= n,
            forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
        decreases n - m,
    {
        let mut i: usize = 0;
        while i < n
            invariant
                square(reach@, n as int),
                m < n,
                i <= n,
                forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
            decreases n - i,
        {
            let mut j: usize = 0;
            while j < n
                invariant
                    square(reach@, n as int),
                    m < n,
                    i < n,
                    j <= n,
                    forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
                decreases n - j,
            {
                if let (Some(a), Some(b)) = (reach[i][m], reach[m][j]) {
                    let v = combine(reach[i][j], a || b);
                    let ghost before = reach@;
                    update(&mut reach, i, j, v, Ghost(n as int));
                    assert forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) implies consistent(reach@, val, n as int) by {
                        assert(consistent(before, val, n as int));
                        assert(holds(a, val[i as int], val[m as int]));
                        assert(holds(b, val[m as int], val[j as int]));
                        assert(holds(a || b, val[i as int], val[j as int]));
                        assert(holds(v.unwrap(), val[i as int], val[j as int]));
                    }
                }
                j += 1;
            }
            i += 1;
        }
        m += 1;
    }

    // A strict cycle: some value below itself.
    let mut i: usize = 0;
    while i < n
        invariant
            square(reach@, n as int),
            i <= n,
            forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
        decreases n - i,
    {
        if let Some(true) = reach[i][i] {
            assert forall|val: Seq<int>| val.len() == n implies !#[trigger] satisfies(val, edges@, differ@) by {
                if satisfies(val, edges@, differ@) {
                    assert(consistent(reach@, val, n as int));
                    assert(holds(true, val[i as int], val[i as int]));
                }
            }
            return true;
        }
        i += 1;
    }
    // Two values that must differ, and cannot.
    let mut k: usize = 0;
    while k < differ.len()
        invariant
            square(reach@, n as int),
            forall|e: int| 0 <= e < differ.len() ==> #[trigger] differ[e].0 < n && differ[e].1 < n,
            k <= differ.len(),
            forall|val: Seq<int>| val.len() == n && #[trigger] satisfies(val, edges@, differ@) ==> consistent(reach@, val, n as int),
        decreases differ.len() - k,
    {
        let (i, j) = differ[k];
        if i == j || (reach[i][j].is_some() && reach[j][i].is_some()) {
            assert forall|val: Seq<int>| val.len() == n implies !#[trigger] satisfies(val, edges@, differ@) by {
                if satisfies(val, edges@, differ@) {
                    assert(val[differ@[k as int].0 as int] != val[differ@[k as int].1 as int]);
                    if i != j {
                        assert(consistent(reach@, val, n as int));
                        assert(holds(reach@[i as int]@[j as int].unwrap(), val[i as int], val[j as int]));
                        assert(holds(reach@[j as int]@[i as int].unwrap(), val[j as int], val[i as int]));
                    }
                }
            }
            return true;
        }
        k += 1;
    }
    false
}

} // verus!
