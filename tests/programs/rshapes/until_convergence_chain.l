# Nodes reached from 1 in a chain graph, until nothing changes.
# Expect: rows R = [(1,), (2,), (3,), (4,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
@Recursive(R, -1);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
