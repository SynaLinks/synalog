# @Dataset takes a schema name, not SQL.
# Expect: error is not a schema name
@Dataset("x; DROP TABLE t");
V(x: 1);
Q(x:) :- V(x:);
