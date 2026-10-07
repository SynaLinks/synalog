# @Limit of zero rows.
# Expect: rows V = []
@OrderBy(V, "x");
@Limit(V, 0);
V(x:) :- x in [1, 2];
