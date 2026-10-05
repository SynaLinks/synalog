# Test: x / 2 of a null is null. (from tests/programs/nullgrid/div_of_null_number.l)

V(k: 1, x: null);
V(k: 2, x: 4);
@OrderBy(N, "k");
N(k:, n: IsNull(x / 2)) :- V(k:, x:);
