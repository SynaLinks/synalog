# The rows a search keeps come in the predicate's order.
# Expect: search O a = [("zag",), ("bar",), ("ant",)]
@OrderBy(O, "s desc");
O(s:) :- s in ["ant", "zag", "bee", "bar"];
