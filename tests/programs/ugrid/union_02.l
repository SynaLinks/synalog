# A union of [1] and [1], with and without distinct.
# Expect: rows U = [(1,), (1,)]
# Expect: rows D = [(1,)]
U(x: 1);
U(x: 1);
@OrderBy(U, "x");
@OrderBy(D, "x");
D(x:) distinct :- U(x:);
