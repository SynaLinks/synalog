# Inequality between two variables.
# Expect: rows Pair = [(1, 2), (2, 1)]
V(x:) :- x in [1, 2];
@OrderBy(Pair, "a", "b");
Pair(a:, b:) :- V(x: a), V(x: b), a != b;
