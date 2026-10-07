# Remainders of negative values.
# Expect: rows M = [(-7, -1), (7, 1)]
V(x:) :- x in [-7, 7];
@OrderBy(M, "x");
M(x:, r: x % 3) :- V(x:);
