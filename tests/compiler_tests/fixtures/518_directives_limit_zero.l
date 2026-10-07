# Test: @Limit of zero rows. (from tests/programs/directives/26_limit_zero.l)

@OrderBy(V, "x");
@Limit(V, 0);
V(x:) :- x in [1, 2];
