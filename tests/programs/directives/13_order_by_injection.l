# An @OrderBy item lands in ORDER BY: it must be a column, never SQL.
# Expect: error 'x; DROP TABLE t' is not a column to order by
# Expect: compile-error V 'x; DROP TABLE t' is not a column to order by
@OrderBy(V, "x; DROP TABLE t");
V(x:) :- x in [1, 2];
