# [1, 2, 3] without [2].
# Expect: rows N = [(1,), (3,)]
V(x:) :- x in [1, 2, 3];
X(x: 2);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
