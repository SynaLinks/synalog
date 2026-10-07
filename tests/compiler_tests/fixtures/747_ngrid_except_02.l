# Test: [1, 2] without []. (from tests/programs/ngrid/except_02.l)

V(x:) :- x in [1, 2];
X(x:) :- x in [0], x > 1;
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
