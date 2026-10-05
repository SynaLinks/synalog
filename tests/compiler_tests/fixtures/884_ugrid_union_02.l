# Test: A union of [1] and [1], with and without distinct. (from tests/programs/ugrid/union_02.l)

@OrderBy(D, "x");
D(x:) distinct :- U(x:);
U(x: 1);
U(x: 1);
@OrderBy(U, "x");
