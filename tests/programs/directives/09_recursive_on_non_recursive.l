# @Recursive on a predicate that does not recurse is harmless.
# Expect: rows V = [(1,), (2,)]
@Recursive(V, 5);
@OrderBy(V, "x");
V(x:) :- x in [1, 2];
