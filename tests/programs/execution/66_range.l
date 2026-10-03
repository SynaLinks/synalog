# Range(n) is 0 .. n-1.
# Expect: rows R = [(0,), (1,), (2,)]
@OrderBy(R, "x");
R(x:) :- x in Range(3);
