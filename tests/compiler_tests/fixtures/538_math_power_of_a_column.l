# Test: Powers of a column. (from tests/programs/math/17_power_of_a_column.l)

V(x:) :- x in [2, 3];
@OrderBy(M, "x");
M(x:, p: x ^ 2) :- V(x:);
