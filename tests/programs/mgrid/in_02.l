# Values of [1, 2, 3] in [4].
# Expect: rows M = []
V(x:) :- x in [1, 2, 3];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [4];
