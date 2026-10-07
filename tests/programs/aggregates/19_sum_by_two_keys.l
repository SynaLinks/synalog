# Grouping by two columns.
# Expect: rows A = [("a", 1, 3), ("a", 2, 4), ("b", 1, 5)]
V(g: "a", h: 1, x: 1);
V(g: "a", h: 1, x: 2);
V(g: "a", h: 2, x: 4);
V(g: "b", h: 1, x: 5);
@OrderBy(A, "g", "h");
A(g:, h:, t? += x) distinct :- V(g:, h:, x:);
