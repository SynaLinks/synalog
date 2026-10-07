# A quoted table name is a name, never a subquery.
# Expect: error is not a table name
Q(x:) :- `(SELECT 7 AS x)`(x:);
