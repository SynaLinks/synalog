# An expression is not a column: order by a column computed in the rule.
# Expect: error 'x * 2' is not a column to order by
@OrderBy(V, "x * 2");
V(x:) :- x in [1, 2];
