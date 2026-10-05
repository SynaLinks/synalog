# Negating with a computed value.
# Expect: rows N = [(1,), (3,)]
V(x:) :- x in [1, 2, 3];
Even(x:) :- V(x:), x % 2 == 0;
@OrderBy(N, "x");
N(x:) :- V(x:), ~Even(x: x);
