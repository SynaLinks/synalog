# Verifier Test: @OrderBy a column the predicate does not have.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/06_order_by_unknown_column.l)

@OrderBy(V, "nope");
V(x:) :- x in [1, 2];
