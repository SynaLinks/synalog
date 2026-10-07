# Test: A program the verifier accepts: assignment then use. (from tests/programs/verifier2/valid_assignment_then_use.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n");
Q(n:, d:) :- N(n:), d == n * 2, d > 2;
