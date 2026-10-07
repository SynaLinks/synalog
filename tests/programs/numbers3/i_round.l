# Rounded, half away from zero.
# Expect: rows Q = [(1, 17.0), (2, -17.0), (3, 4.0), (4, 0.0), (5, None), (6, 3000000000.0), (7, -1.0), (8, 9.0)]
X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Round(x)) :- X(k:, x:);
