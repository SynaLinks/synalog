# Test: An integer equals the same fraction. (from tests/programs/numbers/01_int_equals_float.l)

V(x:) :- x in [1, 2];
N(x:) :- V(x:), x == 2.0;
