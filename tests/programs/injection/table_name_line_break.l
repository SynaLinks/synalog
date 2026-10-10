# A quoted table name is one line.
# Expect: error is not a table name
Q(x:) :- `t
; DROP TABLE t`(x:);
