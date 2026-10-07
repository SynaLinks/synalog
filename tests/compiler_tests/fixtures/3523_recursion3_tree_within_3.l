# Test: Nodes within 3 steps of 1 in the tree graph. (from tests/programs/recursion3/tree_within_3.l)

E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 4);
E(a: 2, b: 4, w: 2);
E(a: 2, b: 5, w: 6);
E(a: 3, b: 6, w: 1);
E(a: 3, b: 7, w: 1);
@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
