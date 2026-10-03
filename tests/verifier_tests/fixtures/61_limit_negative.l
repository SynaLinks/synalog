# Verifier Test: a negative @Limit
# Expected Error: DirectiveError.invalidDirective

# ERROR: the limit is 0 or more
@Limit(V, -1);
V(x:) :- x in [1, 2];
