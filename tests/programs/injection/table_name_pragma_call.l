# A quoted table name calls no pragma function, whatever its argument.
# Expect: valid
# Expect: run-error Q pragma_table_info
V(x: 1);
Q(name:) :- `pragma_table_info('sqlite_master')`(name:);
