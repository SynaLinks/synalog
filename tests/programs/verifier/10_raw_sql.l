# SqlExpr is refused.
# Expect: error Unsafe SqlExpr

Now2(t:) :- t == SqlExpr("now()", {});
