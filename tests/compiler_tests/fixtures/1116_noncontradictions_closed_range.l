# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/closed_range.l)

V(x:) :- x in [2, 3, 4];
C(x:) :- V(x:), x >= 3, x <= 3;
