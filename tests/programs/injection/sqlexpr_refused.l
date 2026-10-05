# Raw SQL is refused in a program.
# Expect: error SqlExpr
Q(x: SqlExpr("1; DROP TABLE t", {}));
