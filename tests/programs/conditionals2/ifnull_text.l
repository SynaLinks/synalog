# Ifnull of a text.
# Expect: rows Q = [(1, 'a'), (2, 'none'), (3, 'c'), (4, 'd'), (5, 'none'), (6, 'f')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: Ifnull(s, "none")) :- V(k:, x:, s:);
