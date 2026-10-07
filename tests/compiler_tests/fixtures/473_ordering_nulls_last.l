# Test: Nulls sort last, ascending or descending, on every engine. (from tests/programs/ordering/09_nulls_last.l)

V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(D, "x desc");
D(x:) :- V(x:);
@OrderBy(A, "x");
A(x:) :- V(x:);
