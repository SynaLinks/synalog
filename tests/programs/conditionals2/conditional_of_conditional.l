# A conditional on a conditional's value.
# Expect: rows Q = [(1, 'p'), (2, 'q'), (3, 'q'), (4, 'q'), (5, 'p'), (6, 'p')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if (if x > 0 then 1 else 0) == 1 then "p" else "q")) :- V(k:, x:, s:);
