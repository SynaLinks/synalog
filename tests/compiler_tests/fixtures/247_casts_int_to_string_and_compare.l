# Test: Comparing numbers as text. (from tests/programs/casts/08_int_to_string_and_compare.l)

V(x:) :- x in [9, 10];
@OrderBy(C, "s");
C(s:) :- V(x:), s == ToString(x);
