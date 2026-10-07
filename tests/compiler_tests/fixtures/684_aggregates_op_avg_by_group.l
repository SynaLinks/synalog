# Test: Avg= per group. (from tests/programs/aggregates/op_avg_by_group.l)

V(g: "a", x:) :- x in [4, 1, 7, 1];
V(g: "b", x: 5);
@OrderBy(A, "g");
A(g:, v? Avg= x) distinct :- V(g:, x:);
