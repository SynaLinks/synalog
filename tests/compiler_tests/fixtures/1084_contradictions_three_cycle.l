# Test: Conditions that can never all hold. (from tests/programs/contradictions/three_cycle.l)

V(x:) :- x in [1, 2];
C(a:) :- V(x: a), V(x: b), V(x: c), a < b, b < c, c < a;
