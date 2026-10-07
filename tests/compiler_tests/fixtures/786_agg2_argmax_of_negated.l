# Test: ArgMax of a negated score is the lowest. (from tests/programs/agg2/argmax_of_negated.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
A(w? ArgMax= n -> -s) distinct :- V(n:, s:);
