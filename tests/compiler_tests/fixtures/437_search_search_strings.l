# Test: Rows where a column matches a regular expression. (from tests/programs/search/01_search_strings.l)

@OrderBy(O, "s");
O(s:) :- s in ["apple", "banana", "blue", "cab"];
