# Nodes reached from 1 in the tree graph, until nothing changes.
# Expect: rows R = [(1,), (2,), (3,), (4,), (5,), (6,), (7,)]
E(a: 1, b: 2, w: 1);
E(a: 1, b: 3, w: 4);
E(a: 2, b: 4, w: 2);
E(a: 2, b: 5, w: 6);
E(a: 3, b: 6, w: 1);
E(a: 3, b: 7, w: 1);
@OrderBy(R, "x");
@Recursive(R, -1);
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
