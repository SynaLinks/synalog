# Test: A comparison with null keeps no row. (from tests/programs/nulls/06_comparison_with_null_is_not_true.l)

V(x: 1);
V(x: null);
@OrderBy(N, "x");
N(x:) :- V(x:), x < 5;
