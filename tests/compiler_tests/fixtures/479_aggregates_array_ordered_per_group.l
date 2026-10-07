# Test: Array= per group. (from tests/programs/aggregates/16_array_ordered_per_group.l)

V(g: "x", k: 2, v: 1);
V(g: "x", k: 1, v: 2);
V(g: "y", k: 5, v: 3);
@OrderBy(A, "g");
A(g:, l? Array= k -> v) distinct :- V(g:, k:, v:);
