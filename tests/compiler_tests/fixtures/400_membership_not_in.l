# Test: The complement of a membership. (from tests/programs/membership/03_not_in.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [2]);
