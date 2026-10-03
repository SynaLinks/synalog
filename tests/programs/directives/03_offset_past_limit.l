# An offset inside @Limit: only the limited rows are paged.
# Expect: page V 10 2 = [(3,)]
@OrderBy(V, "x");
@Limit(V, 3);
V(x:) :- x in [5, 3, 1, 4, 2];
