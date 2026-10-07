# Test: [1, 2] without [1, 2]. (from tests/programs/ngrid/except_03.l)

V(x:) :- x in [1, 2];
X(x: 1);
X(x: 2);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
