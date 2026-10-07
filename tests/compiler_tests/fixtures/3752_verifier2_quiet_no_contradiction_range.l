# Test: No warning: no contradiction range. (from tests/programs/verifier2/quiet_no_contradiction_range.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:), n > 1, n < 3;
