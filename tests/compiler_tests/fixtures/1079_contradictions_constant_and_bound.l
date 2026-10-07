# Test: Conditions that can never all hold. (from tests/programs/contradictions/constant_and_bound.l)

V(x:) :- x in [1, 2];
C(x:) :- V(x:), x == 2, x > 3;
