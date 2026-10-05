# A chain of 3 edges, at most 5 steps.
# Expect: rows R = [(0,), (1,), (2,), (3,)]
E(a:, b: a + 1) :- a in Range(3);
@Recursive(R, 5);
@OrderBy(R, "x");
R(x: 0) distinct;
R(x: b) distinct :- R(x: a), E(a:, b:);
