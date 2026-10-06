# A program the verifier accepts: combine with local var.
# Expect: valid
# Expect: rows Q = [(1, 2), (2, 3), (3, None)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, m: (combine Max= b :- E(a: n, b:))) :- N(n:);
