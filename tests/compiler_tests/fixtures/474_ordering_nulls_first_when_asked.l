# Test: An ordering that says where nulls go is kept. (from tests/programs/ordering/10_nulls_first_when_asked.l)

V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(A, "x nulls first");
A(x:) :- V(x:);
