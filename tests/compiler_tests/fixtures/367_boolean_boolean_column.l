# Test: A comparison as a column. (from tests/programs/boolean/03_boolean_column.l)

V(x:) :- x in [1, 3];
@OrderBy(B, "x");
B(x:, big: x > 2) :- V(x:);
