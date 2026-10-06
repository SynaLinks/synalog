# Refused: order by sql.
# Expect: error is not a column to order by
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "n; DROP TABLE t");
Q(n:) :- N(n:);
