# Test: A comparison with null keeps no row. (from tests/programs/nulls/23_null_comparison_filters_out.l)

V(k: 1, x: null);
V(k: 2, x: 5);
N(k:) :- V(k:, x:), x > 1;
