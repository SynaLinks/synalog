# A quoted table name calls no table function: `range(3)` would return three rows.
# Expect: valid
# Expect: run-error Q range(3)
Q(range:) :- `range(3)`(range:);
