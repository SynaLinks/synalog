# Test: A variable compared with an expression of itself is a condition: only 0 and 1 are their own square. (from tests/programs/selfref/square_is_itself.l)

V(x:) :- x in [0, 1, 2, 4];
@OrderBy(A, "x");
A(x:) :- V(x:), x == x * x;
