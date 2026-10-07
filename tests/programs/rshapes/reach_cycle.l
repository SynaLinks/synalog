# Nodes reached from 1 in a cycle graph.
# Expect: rows R = [(1,), (2,), (3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
@Recursive(R, 8);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
