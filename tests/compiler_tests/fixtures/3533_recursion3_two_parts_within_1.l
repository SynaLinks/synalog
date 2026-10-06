# Test: Nodes within 1 steps of 1 in the two_parts graph. (from tests/programs/recursion3/two_parts_within_1.l)

E(a: 1, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
E(a: 4, b: 5, w: 1);
E(a: 5, b: 6, w: 1);
E(a: 6, b: 4, w: 1);
@Recursive(R, 1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
