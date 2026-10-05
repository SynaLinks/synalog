# Nodes within 2 step(s) of 1 in a two_parts graph.
# Expect: rows R = [(1,), (2,)]
E(a: 1, b: 2);
E(a: 3, b: 4);
@Recursive(R, 2);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
