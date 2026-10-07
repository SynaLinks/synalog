# A number in a record is a number: 9 sorts before 10.
# Expect: rows Q = [(9,), (10,), (100,)]
R(r: {n: x}) :- x in [100, 9, 10];
@OrderBy(Q, "n");
Q(n: r.n) :- R(r:);
