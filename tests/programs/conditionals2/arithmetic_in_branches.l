# Arithmetic in both branches.
# Expect: rows Q = [(1, 10), (2, -4), (3, -1), (4, None), (5, 24), (6, 14)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x > 0 then x * 2 else x - 1)) :- V(k:, x:, s:);
