# Test: A program the verifier accepts: join and filter. (from tests/programs/verifier2/valid_join_and_filter.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(a:, c:) :- E(a:, b:), E(a: b, b: c);
