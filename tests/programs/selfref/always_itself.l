# A comparison of a variable with an expression of itself that always holds.
# Expect: rows B = [(0,), (1,), (2,), (4,)]
V(x:) :- x in [0, 1, 2, 4];
@OrderBy(B, "x");
B(x:) :- V(x:), x == 2 * x - x;
