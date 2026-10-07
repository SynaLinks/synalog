# Test: A program the verifier accepts: negation of a join. (from tests/programs/verifier2/valid_negation_of_a_join.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:), ~(E(a: n, b: m), N(n: m));
