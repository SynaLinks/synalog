# Test: Values of [1, 2, 3] in [4]. (from tests/programs/mgrid/in_02.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [4];
