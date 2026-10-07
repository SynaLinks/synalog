# Test: Values of [5, 6] in [5, 6]. (from tests/programs/mgrid/in_03.l)

V(x:) :- x in [5, 6];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [5, 6];
