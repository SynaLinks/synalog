# Square roots of a column.
# Expect: rows M = [(4, 2.0), (9, 3.0)]
V(x:) :- x in [4, 9];
@OrderBy(M, "x");
M(x:, r: Sqrt(x)) :- V(x:);
