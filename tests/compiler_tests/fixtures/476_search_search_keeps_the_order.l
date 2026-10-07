# Test: The rows a search keeps come in the predicate's order. (from tests/programs/search/05_search_keeps_the_order.l)

@OrderBy(O, "s desc");
O(s:) :- s in ["ant", "zag", "bee", "bar"];
