# Filtering by membership in a list.
# Expect: rows M = [(2,), (4,)]
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [2, 4, 6];
