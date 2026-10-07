# If() as a function.
# Expect: rows Q = [(1, 'big'), (2, 'small'), (3, 'small'), (4, 'small'), (5, 'big'), (6, 'big')]
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:, v: If(x > 4, "big", "small")) :- V(k:, x:, s:);
