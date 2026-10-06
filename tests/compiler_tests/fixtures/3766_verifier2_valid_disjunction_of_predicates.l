# Test: A program the verifier accepts: disjunction of predicates. (from tests/programs/verifier2/valid_disjunction_of_predicates.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "x");
Q(x:) distinct :- E(a: x) | E(b: x);
