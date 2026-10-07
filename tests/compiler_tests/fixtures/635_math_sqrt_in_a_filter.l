# Test: Filtering by a square root. (from tests/programs/math/23_sqrt_in_a_filter.l)

V(x:) :- x in [4, 16];
M(x:) :- V(x:), Sqrt(x) > 3;
