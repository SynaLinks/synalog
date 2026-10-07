# Test: A program the verifier accepts: negated boolean. (from tests/programs/verifier2/valid_negated_boolean.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
B(n:, big: n > 1) :- N(n:);
Q(n:) :- B(n:, big:), !big;
