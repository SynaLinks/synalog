# Test: Values of [1, 2, 3] not in [2]. (from tests/programs/mgrid/not_in_01.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [2]);
