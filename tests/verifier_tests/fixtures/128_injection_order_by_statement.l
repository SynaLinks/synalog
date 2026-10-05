# Verifier Test: @OrderBy takes a column, not SQL.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/injection/order_by_statement.l)

V(x: 1);
@OrderBy(Q, "x; DROP TABLE t; --");
Q(x:) :- V(x:);
