# Test: Filtering by membership in a list. (from tests/programs/membership/01_in_a_literal_list.l)

V(x:) :- x in [1, 2, 3, 4];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [2, 4, 6];
