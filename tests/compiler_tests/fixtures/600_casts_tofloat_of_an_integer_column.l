# Test: Integers as fractions, divided. (from tests/programs/casts/18_tofloat_of_an_integer_column.l)

V(x:) :- x in [1, 3];
@OrderBy(C, "x");
C(x:, h: ToFloat64(x) / 2) :- V(x:);
