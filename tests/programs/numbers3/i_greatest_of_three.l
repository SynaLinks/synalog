# The greatest of three; null for a null.
# Expect: rows Q = [(1, 17), (2, 1), (3, 4), (4, 1), (5, None), (6, 3000000000), (7, 1), (8, 9)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Greatest(x, 1, -1)) :- X(k:, x:);
