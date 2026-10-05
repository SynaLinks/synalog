# Test: The name with the highest score. (from tests/programs/agg2/argmax_four.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(w? ArgMax= n -> s) distinct :- V(n:, s:);
