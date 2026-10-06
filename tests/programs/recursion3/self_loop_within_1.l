# Nodes within 1 steps of 1 in the self_loop graph.
# Expect: rows R = [(1,), (2,)]
E(a: 1, b: 1, w: 1);
E(a: 1, b: 2, w: 3);
E(a: 2, b: 2, w: 1);
E(a: 2, b: 3, w: 1);
@Recursive(R, 1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
