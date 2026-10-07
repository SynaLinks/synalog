# Test: The item with the highest score per group. (from tests/programs/aggregates/29_argmax_per_group.l)

V(g: "x", n: "a", s: 1);
V(g: "x", n: "b", s: 2);
V(g: "y", n: "c", s: 7);
@OrderBy(A, "g");
A(g:, w? ArgMax= n -> s) distinct :- V(g:, n:, s:);
