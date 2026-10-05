# Verifier Test: @OrderBy refuses an expression.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/injection/order_by_subquery.l)

V(x: 1);
@OrderBy(Q, "x desc, (SELECT 1)");
Q(x:) :- V(x:);
