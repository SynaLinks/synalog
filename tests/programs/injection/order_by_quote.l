# @OrderBy refuses a quote.
# Expect: error is not a column to order by
V(x: 1);
@OrderBy(Q, "x') --");
Q(x:) :- V(x:);
