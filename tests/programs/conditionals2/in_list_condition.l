# Membership as a condition.
# Expect: rows Q = [(1, 'listed'), (2, 'other'), (3, 'listed'), (4, 'other'), (5, 'other'), (6, 'listed')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x in [0, 5, 7] then "listed" else "other")) :- V(k:, x:, s:);
