# Test: compile(limit=, offset=) pages through ordered rows. (from tests/programs/directives/01_page.l)

@OrderBy(V, "x");
V(x:) :- x in [5, 3, 1, 4, 2];
