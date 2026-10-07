# Test: Arithmetic with null is null. (from tests/programs/nulls/22_null_arithmetic.l)

V(k: 1, x: null);
V(k: 2, x: 2);
@OrderBy(N, "k");
N(k:, y: x + 1) :- V(k:, x:);
