# Two rules each reading the recursion once: the nodes reached from 1 along the
# edges either way, within 2 steps.
# Expect: rows R = [(1,), (2,), (3,)]
E(a: 1, b: 2);
E(a: 3, b: 2);
E(a: 4, b: 3);
E(a: 4, b: 5);
@Recursive(R, 2);
@OrderBy(R, "x");
R(x: 1) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
R(x: a) distinct :- R(x: b), E(a:, b:);
