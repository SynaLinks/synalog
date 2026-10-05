# Test: IsNull as a column. (from tests/programs/nulls/13_isnull_as_a_value.l)

V(k: 1, x: 5);
V(k: 2, x: null);
@OrderBy(N, "k");
N(k:, n: IsNull(x)) :- V(k:, x:);
