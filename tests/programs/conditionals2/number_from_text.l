# A number chosen by a text.
# Expect: rows Q = [(1, 1), (2, 0), (3, 3), (4, 0), (5, 0), (6, 0)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if s == "a" then 1 else if s == "c" then 3 else 0)) :- V(k:, x:, s:);
