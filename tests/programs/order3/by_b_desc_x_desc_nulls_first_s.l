# Ordered by b desc, then x desc nulls first, then s, then k.
# Expect: rows Q = [(8, True, 9, 'aa'), (1, True, 5, 'b'), (6, True, 2, 'a'), (3, True, 2, None), (2, False, None, 'a'), (7, False, None, None), (5, False, -1, 'B'), (4, None, 5, 'c')]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "b desc", "x desc nulls first", "s", "k");
Q(k:, b:, x:, s:) :- R(k:, b:, x:, s:);
