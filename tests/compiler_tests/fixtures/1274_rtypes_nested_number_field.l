# Test: A nested record's number field sorts as a number. (from tests/programs/rtypes/nested_number_field.l)

R(r: {inner: {n: x}}) :- x in [10, 9];
@OrderBy(Q, "n");
Q(n: r.inner.n) :- R(r:);
