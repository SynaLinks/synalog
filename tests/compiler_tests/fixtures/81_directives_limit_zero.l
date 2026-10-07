# Test: @Limit 0 returns nothing. (from tests/programs/directives/17_limit_zero.l)

@Limit(V, 0);
V(x:) :- x in [1, 2];
