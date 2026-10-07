# A distinct predicate removes duplicate rows.
# Expect: rows D = [(1,), (2,)]
R(x: 1);
R(x: 1);
R(x: 2);
@OrderBy(D, "x");
D(x:) distinct :- R(x:);
