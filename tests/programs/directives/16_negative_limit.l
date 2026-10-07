# A negative limit.
# Expect: error @Limit(V): the limit must be a whole number of rows, 0 or more
@Limit(V, -1);
V(x:) :- x in [1, 2];
