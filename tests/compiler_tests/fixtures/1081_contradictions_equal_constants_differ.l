# Test: Conditions that can never all hold. (from tests/programs/contradictions/equal_constants_differ.l)

V(x:) :- x in [1, 2];
C(x:) :- V(x:), x == 1, x != 1.0;
