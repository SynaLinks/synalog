# @OrderBy a column the predicate does not have.
# Expect: error @OrderBy(V): 'V' has no column 'nope' (its columns: x)
@OrderBy(V, "nope");
V(x:) :- x in [1, 2];
