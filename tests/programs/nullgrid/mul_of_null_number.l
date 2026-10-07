# x * 2 of a null is null.
# Expect: rows N = [(1, True), (2, False)]
V(k: 1, x: null);
V(k: 2, x: 4);
@OrderBy(N, "k");
N(k:, n: IsNull(x * 2)) :- V(k:, x:);
