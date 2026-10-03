# Verifier Test: @Ground a predicate that does not exist
# Expected Error: DirectiveError.invalidDirective

# ERROR: Nope is not defined
@Ground(Nope);
V(x:) :- x in [1, 2];
