# A table name is no URL: it holds no slash.
# Expect: error is not a table name
Q(x:) :- `https://example.com/secret.csv`(x:);
