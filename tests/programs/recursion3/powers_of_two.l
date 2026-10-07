# Powers of two below 1000, by recursion.
# Expect: rows P = [(1,), (2,), (4,), (8,), (16,), (32,), (64,), (128,), (256,), (512,)]
@Recursive(P, -1);
@OrderBy(P, "x");
P(x: 1) distinct;
P(x: x * 2) distinct :- P(x:), x * 2 < 1000;
