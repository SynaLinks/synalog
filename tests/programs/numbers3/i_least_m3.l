# The lesser of x and -3; null for a null.
# Expect: rows Q = [(1, -3), (2, -17), (3, -3), (4, -3), (5, None), (6, -3), (7, -3), (8, -3)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Least(x, -3)) :- X(k:, x:);
