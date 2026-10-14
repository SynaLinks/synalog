# A quoted field name is a column name, backslash and all.
# Expect: rows Q = [(1,)]
R(`a\b`: 1);
Q(x:) :- R(`a\b`: x);
