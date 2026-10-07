# && binds tighter than ||.
# Expect: rows B = [(2,), (3,), (10,)]
V(x:) :- x in [1, 2, 3, 10];
@OrderBy(B, "x");
B(x:) :- V(x:), x > 1 && x < 4 || x == 10;
