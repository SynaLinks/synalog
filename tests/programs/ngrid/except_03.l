# [1, 2] without [1, 2].
# Expect: rows N = []
V(x:) :- x in [1, 2];
X(x: 1);
X(x: 2);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
