# Verifier Test: @Ground of an undefined predicate.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/11_ground_unknown_predicate.l)

@Ground(Nope);
V(x:) :- x in [1, 2];
