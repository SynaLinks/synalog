# Nodes within 3 steps of 1 in the cycle graph.
# Expect: rows R = [(1,), (2,), (3,), (4,)]
E(a: 1, b: 2, w: 2);
E(a: 2, b: 3, w: 2);
E(a: 3, b: 4, w: 2);
E(a: 4, b: 1, w: 2);
E(a: 4, b: 5, w: 7);
@Recursive(R, 3);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
