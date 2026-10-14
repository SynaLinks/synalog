# A quoted table name is a name, never a subquery: it is quoted for the engine,
# which looks for a table of that name and finds none.
# Expect: valid
# Expect: run-error Q (SELECT 7 AS x)
Q(x:) :- `(SELECT 7 AS x)`(x:);
