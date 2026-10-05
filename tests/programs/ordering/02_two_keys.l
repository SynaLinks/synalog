# Ordering by two columns, opposite directions.
# Expect: rows O = [("a", 2), ("a", 1), ("b", 5)]
V(g: "b", x: 5);
V(g: "a", x: 1);
V(g: "a", x: 2);
@OrderBy(O, "g", "x desc");
O(g:, x:) :- V(g:, x:);
