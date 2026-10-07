# A conjunction as a condition.
# Expect: rows Q = [(1, 'both'), (2, 'no'), (3, 'no'), (4, 'no'), (5, 'no'), (6, 'both')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x > 0 && s is not null then "both" else "no")) :- V(k:, x:, s:);
