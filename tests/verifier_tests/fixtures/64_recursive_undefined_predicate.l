# Verifier Test: @Recursive about a predicate that does not exist
# Expected Error: DirectiveError.invalidDirective

# ERROR: Nope is not defined
@Recursive(Nope, 5);
V(x:) :- x in [1, 2];
