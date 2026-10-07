# A table named in @Ground lives in Synalog's schema: a program cannot replace
# a table elsewhere. The rows are still the predicate's.
# Expect: rows R = [(1,), (2,)]
V(x: 1);
V(x: 2);
@Ground(Q, Users);
Q(x:) :- V(x:);
@OrderBy(R, "x");
R(x:) :- Q(x:);
