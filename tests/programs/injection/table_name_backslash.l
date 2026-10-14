# A quoted table name holds no backslash: nothing escapes the quoting.
# Expect: error is not a table name
Q(x:) :- `t\`(x:);
