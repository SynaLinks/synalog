# Refused: order by unknown column.
# Expect: error has no column 'zz'
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "zz");
Q(n:) :- N(n:);
