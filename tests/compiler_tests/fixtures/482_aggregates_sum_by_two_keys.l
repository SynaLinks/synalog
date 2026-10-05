# Test: Grouping by two columns. (from tests/programs/aggregates/19_sum_by_two_keys.l)

V(g: "a", h: 1, x: 1);
V(g: "a", h: 1, x: 2);
V(g: "a", h: 2, x: 4);
V(g: "b", h: 1, x: 5);
@OrderBy(A, "g", "h");
A(g:, h:, t? += x) distinct :- V(g:, h:, x:);
