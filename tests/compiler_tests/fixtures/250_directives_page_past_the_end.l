# Test: A page past the last row is empty. (from tests/programs/directives/23_page_past_the_end.l)

@OrderBy(V, "x");
V(x:) :- x in [1, 2, 3];
