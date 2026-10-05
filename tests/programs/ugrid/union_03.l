# A union of [5] and [], with and without distinct.
# Expect: rows U = [(5,)]
# Expect: rows D = [(5,)]
U(x: 5);
@OrderBy(U, "x");
@OrderBy(D, "x");
D(x:) distinct :- U(x:);
