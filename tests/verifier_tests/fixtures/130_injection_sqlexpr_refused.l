# Verifier Test: Raw SQL is refused in a program.
# Expected Error: SqlExprError.unsafeSqlExpr
#
# (from tests/programs/injection/sqlexpr_refused.l)

Q(x: SqlExpr("1; DROP TABLE t", {}));
