# Without distinct, duplicate rows are kept.
# Expect: rows M = [(1,), (1,), (2,)]
R(x: 1);
R(x: 1);
R(x: 2);
@OrderBy(M, "x");
M(x:) :- R(x:);
