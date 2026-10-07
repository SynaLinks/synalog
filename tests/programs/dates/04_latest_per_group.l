# The latest date per group.
# Expect: rows L = [("a", "2024-05-01"), ("b", "2023-01-01")]
V(g: "a", d: "2024-01-01");
V(g: "a", d: "2024-05-01");
V(g: "b", d: "2023-01-01");
@OrderBy(L, "g");
L(g:, d? Max= d) distinct :- V(g:, d:);
