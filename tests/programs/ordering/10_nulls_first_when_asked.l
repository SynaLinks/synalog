# An ordering that says where nulls go is kept.
# Expect: rows A = [(None,), (1,), (3,)]
V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(A, "x nulls first");
A(x:) :- V(x:);
