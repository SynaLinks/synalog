# Test: @Recursive on a predicate that does not recurse is harmless. (from tests/programs/directives/09_recursive_on_non_recursive.l)

@Recursive(V, 5);
@OrderBy(V, "x");
V(x:) :- x in [1, 2];
