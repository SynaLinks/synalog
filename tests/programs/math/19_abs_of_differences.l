# Absolute differences between rows.
# Expect: rows M = [(1, 4, 3), (4, 1, 3)]
V(x:) :- x in [1, 4];
@OrderBy(M, "a");
M(a:, b:, d: Abs(a - b)) :- V(x: a), V(x: b), a != b;
