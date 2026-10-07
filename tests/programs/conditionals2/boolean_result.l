# A conditional giving a boolean.
# Expect: rows Q = [(1, True), (2, False), (3, False), (4, False), (5, True), (6, True)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x is null then false else x > 0)) :- V(k:, x:, s:);
