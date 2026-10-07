# @Limit 0 returns nothing.
# Expect: rows V = []
@Limit(V, 0);
V(x:) :- x in [1, 2];
