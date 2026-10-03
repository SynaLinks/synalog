# Verifier Test: @OrderBy a column the predicate does not have
# Expected Error: DirectiveError.invalidDirective

# ERROR: V has no column nope
@OrderBy(V, "nope");
V(x:) :- x in [1, 2];
