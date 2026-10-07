# Values of [1, 2, 3] not in [4].
# Expect: rows M = [(1,), (2,), (3,)]
V(x:) :- x in [1, 2, 3];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [4]);
