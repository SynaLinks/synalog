# Test: Grouping by a value with a default. (from tests/programs/nulls/24_coalesce_in_a_group_key.l)

V(g: null);
V(g: null);
V(g: "x");
@OrderBy(N, "k");
N(k: Coalesce(g, "none"), n? += 1) distinct :- V(g:);
