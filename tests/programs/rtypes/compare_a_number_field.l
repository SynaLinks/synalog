# A number field compares as a number: 10 > 9.
# Expect: rows Q = [(10,), (100,)]
R(r: {n: x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:), r.n > 9;
