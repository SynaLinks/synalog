# Divided by zero: null.
# Expect: rows Q = [(1, None), (2, None), (3, None), (4, None), (5, None), (6, None), (7, None), (8, None)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: x / 0) :- X(k:, x:);
