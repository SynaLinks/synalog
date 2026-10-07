# Verifier Test: @Limit a predicate that does not exist
# Expected Error: DirectiveError.invalidDirective

# ERROR: Nope is not defined
@Limit(Nope, 2);
V(x:) :- x in [1, 2];
