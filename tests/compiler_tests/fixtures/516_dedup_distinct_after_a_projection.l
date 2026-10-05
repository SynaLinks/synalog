# Test: distinct after dropping a column. (from tests/programs/dedup/05_distinct_after_a_projection.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
@OrderBy(D, "g");
D(g:) distinct :- V(g:, x:);
