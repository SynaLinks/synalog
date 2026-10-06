# Nodes within 3 steps of 1 in the diamond graph.
# Expect: rows R = [(1,), (2,), (3,), (4,), (5,)]
E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 5);
E(a: 2, b: 4, w: 5);
E(a: 3, b: 4, w: 1);
E(a: 4, b: 5, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
