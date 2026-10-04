# Test: search matches numbers as text. (from tests/programs/directives/22_search_numbers.l)

@OrderBy(V, "x");
V(x:) :- x in [1, 2, 12];
