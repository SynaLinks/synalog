# Test: The effective limit is min(limit, @Limit). (from tests/programs/directives/02_page_within_limit.l)

@OrderBy(V, "x");
@Limit(V, 3);
V(x:) :- x in [5, 3, 1, 4, 2];
