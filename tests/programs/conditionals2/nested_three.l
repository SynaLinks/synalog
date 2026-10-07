# Three nested conditionals.
# Expect: rows Q = [(1, 'big'), (2, 'small'), (3, 'small'), (4, '?'), (5, 'huge'), (6, 'big')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: (if x is null then "?" else if x > 10 then "huge" else if x > 4 then "big" else "small")) :- V(k:, x:, s:);
