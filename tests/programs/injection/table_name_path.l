# A table name is no path to a file.
# Expect: error is not a table name
Q(x:) :- `../secret.csv`(x:);
