# Test: Enumerating a range. (from tests/programs/membership/05_in_a_range.l)

@OrderBy(M, "x");
M(x:) :- x in Range(3);
