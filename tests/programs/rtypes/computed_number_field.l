# A computed number field sorts as a number.
# Expect: rows Q = [(18,), (20,), (200,)]
R(r: {n: 2 * x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:);
