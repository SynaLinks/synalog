# Test: Comparing integers with a fraction. (from tests/programs/numbers/02_compare_int_and_fraction.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(N, "x");
N(x:) :- V(x:), x > 1.5;
