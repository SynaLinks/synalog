# Verifier Test: @Limit with a string
# Expected Error: DirectiveError.invalidDirective

# ERROR: the limit is a number of rows
@Limit(V, "two");
V(x:) :- x in [1, 2];
