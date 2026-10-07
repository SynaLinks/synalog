# Test: && binds tighter than ||. (from tests/programs/boolean/02_precedence.l)

V(x:) :- x in [1, 2, 3, 10];
@OrderBy(B, "x");
B(x:) :- V(x:), x > 1 && x < 4 || x == 10;
