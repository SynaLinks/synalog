# Test: No warning: no contradiction arithmetic. (from tests/programs/verifier2/quiet_no_contradiction_arithmetic.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:), n + 1 > 3, n < 3;
