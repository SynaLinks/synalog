# Values of [5, 6] not in [5, 6].
# Expect: rows M = []
V(x:) :- x in [5, 6];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [5, 6]);
