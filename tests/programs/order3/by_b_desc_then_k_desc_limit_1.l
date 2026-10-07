# Ordered by b desc, then k desc, the first 1; nulls last unless asked first.
# Expect: rows Q = [(8, 9, 'aa', True)]
R(k: 1, x: 5, s: "b", b: true);
R(k: 2, x: null, s: "a", b: false);
R(k: 3, x: 2, s: null, b: true);
R(k: 4, x: 5, s: "c", b: null);
R(k: 5, x: -1, s: "B", b: false);
R(k: 6, x: 2, s: "a", b: true);
R(k: 7, x: null, s: null, b: false);
R(k: 8, x: 9, s: "aa", b: true);
@OrderBy(Q, "b desc", "k desc");
@Limit(Q, 1);
Q(k:, x:, s:, b:) :- R(k:, x:, s:, b:);
