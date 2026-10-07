# Ordering by text, then a number descending.
# Expect: rows O = [("a", 2), ("a", 1), ("b", 3)]
V(s: "b", n: 3);
V(s: "a", n: 1);
V(s: "a", n: 2);
@OrderBy(O, "s", "n desc");
O(s:, n:) :- V(s:, n:);
