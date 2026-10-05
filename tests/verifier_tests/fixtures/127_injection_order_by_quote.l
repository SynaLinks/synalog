# Verifier Test: @OrderBy refuses a quote.
# Expected Error: DirectiveError.invalidDirective
#
# (from tests/programs/injection/order_by_quote.l)

V(x: 1);
@OrderBy(Q, "x') --");
Q(x:) :- V(x:);
