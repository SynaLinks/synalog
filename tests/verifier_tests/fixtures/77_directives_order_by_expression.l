# Verifier Test: An expression is not a column: order by a column computed in the rule.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/directives/15_order_by_expression.l)

@OrderBy(V, "x * 2");
V(x:) :- x in [1, 2];
