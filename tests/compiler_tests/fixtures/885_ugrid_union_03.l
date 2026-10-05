# Test: A union of [5] and [], with and without distinct. (from tests/programs/ugrid/union_03.l)

@OrderBy(D, "x");
D(x:) distinct :- U(x:);
U(x: 5);
@OrderBy(U, "x");
