# A union of [1, 2] and [2, 3], with and without distinct.
# Expect: rows U = [(1,), (2,), (2,), (3,)]
# Expect: rows D = [(1,), (2,), (3,)]
U(x: 1);
U(x: 2);
U(x: 2);
U(x: 3);
@OrderBy(U, "x");
@OrderBy(D, "x");
D(x:) distinct :- U(x:);
