# Test: An offset inside @Limit: only the limited rows are paged. (from tests/programs/directives/03_offset_past_limit.l)

@OrderBy(V, "x");
@Limit(V, 3);
V(x:) :- x in [5, 3, 1, 4, 2];
