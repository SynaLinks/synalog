# Enumerating a range.
# Expect: rows M = [(0,), (1,), (2,)]
@OrderBy(M, "x");
M(x:) :- x in Range(3);
