# Test: A lower bound above the upper bound. (from tests/programs/contradictions/03_empty_range.l)

V(x:) :- x in [1, 7, 12];
C(x:) :- V(x:), x > 10, x < 5;
