# A program the verifier accepts: bare boolean.
# Expect: valid
# Expect: rows Q = [(2,), (3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
B(n:, big: n > 1) :- N(n:);
Q(n:) :- B(n:, big:), big;
