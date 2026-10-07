# Ordered by the length of s desc, then k.
# Expect: rows Q = [(8, 2), (1, 1), (2, 1), (4, 1), (5, 1), (6, 1), (3, None), (7, None)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "n desc", "k");
Q(k:, n: Length(s)) :- R(k:, s:);
