# Ordered by x % 3 desc (of the sign of x), then k.
# Expect: rows Q = [(1, 2), (3, 2), (4, 2), (6, 2), (8, 0), (5, -1), (2, None), (7, None)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "m desc", "k");
Q(k:, m: x % 3) :- R(k:, x:);
