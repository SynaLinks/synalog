# distinct after dropping a column.
# Expect: rows D = [("a",), ("b",)]
V(g: "a", x: 1);
V(g: "a", x: 2);
V(g: "b", x: 3);
@OrderBy(D, "g");
D(g:) distinct :- V(g:, x:);
