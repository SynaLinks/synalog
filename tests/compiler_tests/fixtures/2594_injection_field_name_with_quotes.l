# Test: A quoted field name is a column name, quotes and all. (from tests/programs/injection/field_name_with_quotes.l)

R(`a"; DROP TABLE t; --`: 1);
Q(x:) :- R(`a"; DROP TABLE t; --`: x);
