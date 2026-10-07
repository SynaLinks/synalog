# Verifier Test: @OrderBy a predicate that does not exist
# Expected Error: DirectiveError.invalidDirective

# ERROR: Nope is not defined
@OrderBy(Nope, "x");
V(x:) :- x in [1, 2];
