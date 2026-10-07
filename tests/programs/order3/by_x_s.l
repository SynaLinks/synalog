# Ordered by x, then s, then k.
# Expect: rows Q = [(5, -1, 'B'), (6, 2, 'a'), (3, 2, None), (1, 5, 'b'), (4, 5, 'c'), (8, 9, 'aa'), (2, None, 'a'), (7, None, None)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "x", "s", "k");
Q(k:, x:, s:) :- R(k:, x:, s:);
