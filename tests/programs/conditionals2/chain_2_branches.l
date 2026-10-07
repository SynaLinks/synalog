# A chain of 2 branches.
# Expect: rows Q = [(1, 1), (2, 0), (3, 1), (4, None), (5, 1), (6, 1)]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x is null then null else if x < 0 then 0 else 1)) :- V(k:, x:);
