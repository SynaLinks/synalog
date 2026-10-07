# Verifier Test: @OrderBy a predicate that does not exist.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/07_order_by_undefined_predicate.l)

@OrderBy(Nope, "x");
V(x:) :- x in [1, 2];
