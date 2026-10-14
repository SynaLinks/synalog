# A table name is no pattern of files.
# Expect: error is not a table name
Q(x:) :- `*.csv`(x:);
