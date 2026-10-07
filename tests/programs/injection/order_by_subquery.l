# @OrderBy refuses an expression.
# Expect: error is not a column to order by
V(x: 1);
@OrderBy(Q, "x desc, (SELECT 1)");
Q(x:) :- V(x:);
