# Verifier Test: @OrderBy an expression
# Expected Error: DirectiveError.invalidDirective
#
# Order by a column computed in the rule instead.

# ERROR: an expression, not a column
@OrderBy(V, "x * 2");
V(x:) :- x in [1, 2];
