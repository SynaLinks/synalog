# A program the verifier accepts: combine in a head.
# Expect: valid
# Expect: rows Q = [(1, 1), (2, 1), (3, None)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, c: (combine += 1 :- E(a: n))) :- N(n:);
