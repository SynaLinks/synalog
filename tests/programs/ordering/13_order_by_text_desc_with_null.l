# Descending text with a null: the null last.
# Expect: rows O = [("b",), ("a",), (None,)]
V(s: "a");
V(s: null);
V(s: "b");
@OrderBy(O, "s desc");
O(s:) :- V(s:);
