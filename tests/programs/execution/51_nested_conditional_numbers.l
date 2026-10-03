# A conditional yielding numbers, used in arithmetic.
# Expect: rows Abs = [(-3, 3), (2, 2)]
V(x:) :- x in [2, -3];
@OrderBy(Abs, "x");
Abs(x:, a:) :- V(x:), a == (if x < 0 then -x else x);
