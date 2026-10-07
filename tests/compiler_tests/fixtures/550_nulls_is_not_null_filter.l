# Test: Keeping the rows with a value. (from tests/programs/nulls/21_is_not_null_filter.l)

V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(N, "x");
N(x:) :- V(x:), x is not null;
