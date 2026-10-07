# Test: A program the verifier accepts: relation named like function. (from tests/programs/verifier2/valid_relation_named_like_function.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Rank(r: 1);
Rank(r: 2);
Q(r:) :- Rank(r:), r > 1;
