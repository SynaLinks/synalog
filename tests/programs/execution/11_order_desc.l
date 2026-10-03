# @OrderBy with DESC.
# Expect: rows Sorted = [("c",), ("b",), ("a",)]
V(s:) :- s in ["b", "a", "c"];
@OrderBy(Sorted, "s DESC");
Sorted(s:) :- V(s:);
