# Comparing integers with a fraction.
# Expect: rows N = [(2,), (3,)]
V(x:) :- x in [1, 2, 3];
@OrderBy(N, "x");
N(x:) :- V(x:), x > 1.5;
