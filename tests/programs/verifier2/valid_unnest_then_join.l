# A program the verifier accepts: unnest then join.
# Expect: valid
# Expect: rows Q = [(2, 'y'), (3, 'z')]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n: x, s:) :- x in [2, 3], N(n: x, s:);
