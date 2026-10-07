# Test: Conditions that can never all hold. (from tests/programs/contradictions/touching_bounds.l)

V(x:) :- x in [1, 2];
C(x:) :- V(x:), x < 1.5, x > 1.5;
