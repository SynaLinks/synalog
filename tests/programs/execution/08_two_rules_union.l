# Two rules for one predicate are a union.
# Expect: rows U = [(1,), (2,)]
@OrderBy(U, "x");
U(x: 1);
U(x: 2);
