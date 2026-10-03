# Verifier Test: A negative limit.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/16_negative_limit.l)

@Limit(V, -1);
V(x:) :- x in [1, 2];
