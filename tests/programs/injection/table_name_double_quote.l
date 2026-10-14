# A quoted table name holds no double quote: nothing ends the quoting.
# Expect: error is not a table name
Q(x:) :- `t" UNION ALL SELECT 7 AS x --`(x:);
