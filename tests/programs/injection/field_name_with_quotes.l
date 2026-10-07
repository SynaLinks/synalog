# A quoted field name is a column name, quotes and all.
# Expect: rows Q = [(1,)]
R(`a"; DROP TABLE t; --`: 1);
Q(x:) :- R(`a"; DROP TABLE t; --`: x);
