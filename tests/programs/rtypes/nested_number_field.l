# A nested record's number field sorts as a number.
# Expect: rows Q = [(9,), (10,)]
R(r: {inner: {n: x}}) :- x in [10, 9];
@OrderBy(Q, "n");
Q(n: r.inner.n) :- R(r:);
