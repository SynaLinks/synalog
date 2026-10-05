# Test: Scores above 2, collected. (from tests/programs/agg2/list_size_above.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
L(l? List= s) distinct :- V(n:, s:), s > 2;
A(n: Size(l)) :- L(l:);
