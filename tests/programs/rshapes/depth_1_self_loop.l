# Nodes within 1 step(s) of 1 in a self_loop graph.
# Expect: rows R = [(1,), (2,)]
E(a: 1, b: 1);
E(a: 1, b: 2);
@Recursive(R, 1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
