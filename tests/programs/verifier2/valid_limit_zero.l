# A program the verifier accepts: limit zero.
# Expect: valid
# Expect: rows Q = []
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@Limit(Q, 0);
Q(n:) :- N(n:);
