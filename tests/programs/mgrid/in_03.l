# Values of [5, 6] in [5, 6].
# Expect: rows M = [(5,), (6,)]
V(x:) :- x in [5, 6];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [5, 6];
