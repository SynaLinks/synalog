# Test: combine Avg= s. (from tests/programs/combine2/combine_05.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
T(t:) :- t == (combine Avg= s :- V(s:));
