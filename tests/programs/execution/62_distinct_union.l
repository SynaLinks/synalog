# A distinct predicate defined by two rules removes duplicates across them.
# Expect: rows U = [(1,), (2,), (3,)]
@OrderBy(U, "x");
U(x:) distinct :- x in [1, 2];
U(x:) distinct :- x in [2, 3];
