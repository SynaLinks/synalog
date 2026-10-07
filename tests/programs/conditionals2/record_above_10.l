# A record of a conditional above 10.
# Expect: rows Q = [(1, 'down'), (2, 'down'), (3, 'down'), (4, 'down'), (5, 'up'), (6, 'down')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
R(k:, r: {d: (if x > 10 then "up" else "down")}) :- V(k:, x:);
@OrderBy(Q, "k");
Q(k:, d: r.d) :- R(k:, r:);
