# Refused: table name sql.
# Expect: error is not a table name
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(x:) :- `t; SELECT 1 AS x`(x:);
