# @OrderBy takes a column, not SQL.
# Expect: error is not a column to order by
V(x: 1);
@OrderBy(Q, "x; DROP TABLE t; --");
Q(x:) :- V(x:);
