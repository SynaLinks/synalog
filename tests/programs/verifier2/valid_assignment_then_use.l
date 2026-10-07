# A program the verifier accepts: assignment then use.
# Expect: valid
# Expect: rows Q = [(2, 4), (3, 6)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, d:) :- N(n:), d == n * 2, d > 2;
