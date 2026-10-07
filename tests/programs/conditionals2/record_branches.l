# A record chosen, then a field of it.
# Expect: rows Q = [(1, 'pos'), (2, 'other'), (3, 'other'), (4, 'other'), (5, 'pos'), (6, 'pos')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x > 0 then {t: "pos"} else {t: "other"}).t) :- V(k:, x:, s:);
