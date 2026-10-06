# Test: Nodes reached from 1 in the diamond graph, until nothing changes. (from tests/programs/recursion3/diamond_reach.l)

E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 5);
E(a: 2, b: 4, w: 5);
E(a: 3, b: 4, w: 1);
E(a: 4, b: 5, w: 1);
E(a: 2, b: 3, w: 1);
@OrderBy(R, "x");
@Recursive(R, -1);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
