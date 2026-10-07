# Test: Fewest steps from 1 in the tree graph. (from tests/programs/recursion3/tree_hops.l)

E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 4);
E(a: 2, b: 4, w: 2);
E(a: 2, b: 5, w: 6);
E(a: 3, b: 6, w: 1);
E(a: 3, b: 7, w: 1);
@Recursive(D, -1);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
