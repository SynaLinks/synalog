# Test: [4] without [5]. (from tests/programs/ngrid/except_04.l)

V(x:) :- x in [4];
X(x: 5);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
