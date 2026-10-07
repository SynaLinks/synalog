# [1, 2] without [].
# Expect: rows N = [(1,), (2,)]
V(x:) :- x in [1, 2];
X(x:) :- x in [0], x > 1;
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
