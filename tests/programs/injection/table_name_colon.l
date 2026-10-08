# A colon in a quoted table name is part of the name: it names no scheme and no schema.
# Expect: valid
# Expect: run-error Q file:secret
Q(x:) :- `file:secret`(x:);
