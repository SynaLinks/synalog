# Verifier Test: SqlExpr is refused.
# Expected Error: SqlExprError.unsafeSqlExpr
#
# (from tests/programs/verifier/10_raw_sql.l)

Now2(t:) :- t == SqlExpr("now()", {});
