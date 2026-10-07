# Test: Square roots of a column. (from tests/programs/math/16_sqrt_of_a_column.l)

V(x:) :- x in [4, 9];
@OrderBy(M, "x");
M(x:, r: Sqrt(x)) :- V(x:);
