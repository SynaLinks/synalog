# Test: Names ordered by score. (from tests/programs/agg2/array_by_score.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(l? Array= s -> n) distinct :- V(n:, s:);
