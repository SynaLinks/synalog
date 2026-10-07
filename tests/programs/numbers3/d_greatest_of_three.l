# The greatest of three; null for a null.
# Expect: rows Q = [(1, 7), (2, 1), (3, 2.5), (4, 1), (5, 1), (6, None), (7, 1), (8, 1)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:, v: Greatest(x, 1, -1)) :- X(k:, x:);
