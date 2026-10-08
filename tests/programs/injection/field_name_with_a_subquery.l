# A quoted field name is a column name, never an expression.
# Expect: rows Q = [(1,)]
R(`(SELECT 7)`: 1);
Q(x:) :- R(`(SELECT 7)`: x);
