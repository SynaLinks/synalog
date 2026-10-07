# The least, a null made 0 first.
# Expect: rows Q = [(1, 1), (2, -7), (3, 1), (4, -2.5), (5, 0), (6, 0), (7, 0.1), (8, -0.75)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:, v: Least(Coalesce(x, 0), 1)) :- X(k:, x:);
