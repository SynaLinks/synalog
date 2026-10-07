# Arithmetic with null is null.
# Expect: rows N = [(1, None), (2, 3)]
V(k: 1, x: null);
V(k: 2, x: 2);
@OrderBy(N, "k");
N(k:, y: x + 1) :- V(k:, x:);
