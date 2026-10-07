# Test: A comparison written both ways can never hold: the rule gives no row, and the verifier says so. (from tests/programs/contradictions/01_reversed_comparison.l)

V(x:) :- x in [1, 2];
C(a:, b:) :- V(x: a), V(x: b), a < b, a >= b;
