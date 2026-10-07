# Test: The largest value of each row's group, by a combine. (from tests/programs/combine/10_combine_per_group_max.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 5);
@OrderBy(T, "g", "x");
T(g:, x:, m:) :- V(g:, x:), m == (combine Max= y :- V(g:, x: y));
