# @Limit takes a number.
# Expect: error @Limit(V): the limit must be a whole number of rows, 0 or more
# Expect: compile-error V @Limit(V): the limit must be a whole number
@Limit(V, "two");
V(x:) :- x in [1, 2];
