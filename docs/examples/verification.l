# expect-errors
# This program is intentionally invalid: the verifier catches every issue
# at compile time, before any SQL is generated.
@Engine("duckdb");

Numbers(x: 1);
Numbers(x: 2);

# 'y' appears in the head but is never bound in the body.
Test(x:, y:) :- Numbers(x:);

# Unbounded recursion: no @Recursive annotation.
Loop(x:) :- Loop(x:);

# 'Num' is a built-in library predicate and cannot be redefined.
Num(n: 1);
