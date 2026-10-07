# The lesser of x and -3; null for a null.
# Expect: rows Q = [(1, -3), (2, -7), (3, -3), (4, -3), (5, -3), (6, None), (7, -3), (8, -3)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:, v: Least(x, -3)) :- X(k:, x:);
