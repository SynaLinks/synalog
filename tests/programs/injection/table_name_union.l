# Parentheses in a quoted table name open no query of their own.
# Expect: valid
# Expect: run-error Q UNION
Q(x:) :- `t) UNION ALL (SELECT 7 AS x`(x:);
