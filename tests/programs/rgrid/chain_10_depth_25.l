# A chain of 10 edges, at most 25 steps.
# Expect: rows R = [(0,), (1,), (2,), (3,), (4,), (5,), (6,), (7,), (8,), (9,), (10,)]
E(a:, b: a + 1) :- a in Range(10);
@Recursive(R, 25);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
