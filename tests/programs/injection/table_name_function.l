# A quoted table name calls no table function.
# Expect: error is not a table name
Q(content:) :- `read_text('/etc/hosts')`(content:);
