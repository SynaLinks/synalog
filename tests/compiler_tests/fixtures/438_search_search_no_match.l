# Test: A search matching nothing. (from tests/programs/search/02_search_no_match.l)

@OrderBy(O, "s");
O(s:) :- s in ["apple", "banana"];
