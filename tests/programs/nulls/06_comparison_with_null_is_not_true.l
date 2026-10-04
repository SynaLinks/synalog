# A comparison with null keeps no row.
# Expect: rows N = [(1,)]
V(x: 1);
V(x: null);
@OrderBy(N, "x");
N(x:) :- V(x:), x < 5;
