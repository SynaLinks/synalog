# Test: The name with the lowest score. (from tests/programs/agg2/argmin_four.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(w? ArgMin= n -> s) distinct :- V(n:, s:);
