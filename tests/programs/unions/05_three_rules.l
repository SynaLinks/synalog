# A predicate of three rules.
# Expect: rows U = [(1,), (2,), (3,)]
@OrderBy(U, "x");
U(x: 1);
U(x: 2);
U(x: 3);
