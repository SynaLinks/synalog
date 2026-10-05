# Test: Values of [1] not in [1, 1]. (from tests/programs/mgrid/not_in_04.l)

V(x:) :- x in [1];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [1, 1]);
