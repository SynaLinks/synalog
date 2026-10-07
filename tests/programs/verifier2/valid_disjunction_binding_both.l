# A program the verifier accepts: disjunction binding both.
# Expect: valid
# Expect: rows Q = [(1,), (3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:) distinct :- N(n:), (n == 1 | n == 3);
