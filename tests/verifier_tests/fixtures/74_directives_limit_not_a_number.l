# Verifier Test: @Limit takes a number.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/08_limit_not_a_number.l)

@Limit(V, "two");
V(x:) :- x in [1, 2];
