# Verifier Test: An @OrderBy item lands in ORDER BY: it must be a column, never SQL.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/13_order_by_injection.l)

@OrderBy(V, "x; DROP TABLE t");
V(x:) :- x in [1, 2];
