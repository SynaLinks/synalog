# Keeping multiples of three.
# Expect: rows N = [(3,), (6,), (9,)]
@OrderBy(N, "x");
N(x:) :- x in Range(10), x % 3 == 0, x > 0;
