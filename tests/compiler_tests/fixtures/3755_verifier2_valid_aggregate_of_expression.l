# Test: A program the verifier accepts: aggregate of expression. (from tests/programs/verifier2/valid_aggregate_of_expression.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(t? += a * b) distinct :- E(a:, b:);
