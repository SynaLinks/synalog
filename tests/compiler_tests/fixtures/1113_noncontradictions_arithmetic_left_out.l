# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/arithmetic_left_out.l)

V(x:) :- x in [1, 2];
@OrderBy(C, "x");
C(x:) :- V(x:), x + 1 > x;
