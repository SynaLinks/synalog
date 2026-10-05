# IsNull as a column.
# Expect: rows N = [(1, False), (2, True)]
V(k: 1, x: 5);
V(k: 2, x: null);
@OrderBy(N, "k");
N(k:, n: IsNull(x)) :- V(k:, x:);
