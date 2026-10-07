# Test: A search matches any column of the result. (from tests/programs/search/03_search_any_column.l)

V(n: 1, s: "xa", t: "q");
V(n: 2, s: "b", t: "xy");
V(n: 3, s: "c", t: "d");
@OrderBy(O, "n");
O(n:, s:, t:) :- V(n:, s:, t:);
