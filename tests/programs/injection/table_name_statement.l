# A quoted table name cannot end the statement.
# Expect: error is not a table name
Q(x:) :- `t; DROP TABLE t; --`(x:);
