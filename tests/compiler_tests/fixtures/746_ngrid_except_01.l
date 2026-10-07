# Test: [1, 2, 3] without [2]. (from tests/programs/ngrid/except_01.l)

V(x:) :- x in [1, 2, 3];
X(x: 2);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
