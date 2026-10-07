# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/two_exclusions.l)

V(x:) :- x in [1, 2, 3];
C(x:) :- V(x:), x != 1, x != 2;
