# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/int_and_float.l)

V(x:) :- x in [1, 2, 3];
C(x:) :- V(x:), x == 2, x == 2.0;
