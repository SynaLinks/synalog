# Divided by zero: null.
# Expect: rows Q = [(1, None), (2, None), (3, None), (4, None), (5, None), (6, None), (7, None), (8, None)]
X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "k");
Q(k:, v: x / 0) :- X(k:, x:);
