# Powers of a column.
# Expect: rows M = [(2, 4.0), (3, 9.0)]
V(x:) :- x in [2, 3];
@OrderBy(M, "x");
M(x:, p: x ^ 2) :- V(x:);
