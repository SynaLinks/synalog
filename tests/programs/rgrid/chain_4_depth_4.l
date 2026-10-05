# A chain of 4 edges, at most 4 steps.
# Expect: rows R = [(0,), (1,), (2,), (3,), (4,)]
E(a:, b: a + 1) :- a in Range(4);
@Recursive(R, 4);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
