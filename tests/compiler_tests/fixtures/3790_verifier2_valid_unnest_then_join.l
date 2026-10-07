# Test: A program the verifier accepts: unnest then join. (from tests/programs/verifier2/valid_unnest_then_join.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n: x, s:) :- x in [2, 3], N(n: x, s:);
