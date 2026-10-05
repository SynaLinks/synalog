# Test: Remainders of negative values. (from tests/programs/math/25_modulo_of_a_negative_column.l)

V(x:) :- x in [-7, 7];
@OrderBy(M, "x");
M(x:, r: x % 3) :- V(x:);
