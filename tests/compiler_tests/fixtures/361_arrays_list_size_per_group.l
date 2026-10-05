# Test: The size of a list collected per group. (from tests/programs/arrays/15_list_size_per_group.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
L(g:, l? List= x) distinct :- V(g:, x:);
@OrderBy(A, "g");
A(g:, n: Size(l)) :- L(g:, l:);
