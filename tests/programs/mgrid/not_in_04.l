# Values of [1] not in [1, 1].
# Expect: rows M = []
V(x:) :- x in [1];
@OrderBy(M, "x");
M(x:) :- V(x:), !(x in [1, 1]);
