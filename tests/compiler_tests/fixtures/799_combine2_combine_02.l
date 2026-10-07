# Test: combine Max= s. (from tests/programs/combine2/combine_02.l)

V(n: "a", s: 3);
V(n: "b", s: 9);
V(n: "c", s: 1);
V(n: "d", s: 5);
T(t:) :- t == (combine Max= s :- V(s:));
