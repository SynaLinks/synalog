# Grouping by a value with a default.
# Expect: rows N = [("none", 2), ("x", 1)]
V(g: null);
V(g: null);
V(g: "x");
@OrderBy(N, "k");
N(k: Coalesce(g, "none"), n? += 1) distinct :- V(g:);
