# A program the verifier accepts: recursion until convergence.
# Expect: valid
# Expect: rows Q = [(1,), (2,), (3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "x");
@Recursive(Q, -1);
Q(x: 1) distinct;
Q(x: b) distinct :- Q(x: a), E(a:, b:);
