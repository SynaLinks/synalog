# Names ordered by score.
# Expect: rows A = [(["c", "a", "d", "b"],)]
V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(l? Array= s -> n) distinct :- V(n:, s:);
