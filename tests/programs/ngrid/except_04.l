# [4] without [5].
# Expect: rows N = [(4,)]
V(x:) :- x in [4];
X(x: 5);
@OrderBy(N, "x");
N(x:) :- V(x:), ~X(x:);
