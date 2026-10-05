# Test: The latest date per group. (from tests/programs/dates/04_latest_per_group.l)

V(g: "a", d: "2024-01-01");
V(g: "a", d: "2024-05-01");
V(g: "b", d: "2023-01-01");
@OrderBy(L, "g");
L(g:, d? Max= d) distinct :- V(g:, d:);
