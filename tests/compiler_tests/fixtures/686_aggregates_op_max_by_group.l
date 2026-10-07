# Test: Max= per group. (from tests/programs/aggregates/op_max_by_group.l)

V(g: "a", x:) :- x in [4, 1, 7, 1];
V(g: "b", x: 5);
@OrderBy(A, "g");
A(g:, v? Max= x) distinct :- V(g:, x:);
