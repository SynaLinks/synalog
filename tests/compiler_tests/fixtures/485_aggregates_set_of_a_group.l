# Test: The set of values per group, its size. (from tests/programs/aggregates/22_set_of_a_group.l)

V(g: "a", x: 1);
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 7);
S(g:, s? Set= x) distinct :- V(g:, x:);
@OrderBy(A, "g");
A(g:, n: Size(s)) :- S(g:, s:);
