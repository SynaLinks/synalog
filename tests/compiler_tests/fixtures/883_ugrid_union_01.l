# Test: A union of [1, 2] and [2, 3], with and without distinct. (from tests/programs/ugrid/union_01.l)

@OrderBy(D, "x");
D(x:) distinct :- U(x:);
U(x: 1);
U(x: 2);
U(x: 2);
U(x: 3);
@OrderBy(U, "x");
