# The effective limit is min(limit, @Limit).
# Expect: page V 10 0 = [(1,), (2,), (3,)]
# Expect: page V 2 0 = [(1,), (2,)]
@OrderBy(V, "x");
@Limit(V, 3);
V(x:) :- x in [5, 3, 1, 4, 2];
