# A predicate of two rules, one giving null.
# Expect: rows U = [(1,), (None,)]
@OrderBy(U, "x");
U(x: 1);
U(x: null);
