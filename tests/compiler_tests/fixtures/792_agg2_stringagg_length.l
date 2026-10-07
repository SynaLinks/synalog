# Test: StringAgg= of four names, by its length. (from tests/programs/agg2/stringagg_length.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
J(j? StringAgg= n) distinct :- V(n:, s:);
A(n: Length(j)) :- J(j:);
