# Test: Integers of a column as text. (from tests/programs/casts/15_tostring_of_an_integer_column.l)

V(x:) :- x in [9, 10];
@OrderBy(C, "s");
C(s: ToString(x)) :- V(x:);
