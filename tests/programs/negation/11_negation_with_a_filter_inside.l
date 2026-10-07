# Negating a filtered predicate.
# Expect: rows N = [(1,), (2,)]
V(x:) :- x in [1, 2, 3];
Big(x:) :- V(x:), x > 2;
@OrderBy(N, "x");
N(x:) :- V(x:), ~Big(x:);
