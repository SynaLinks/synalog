# The string concatenated around.
# Expect: rows Q = [("['; COMMIT; DROP TABLE t; --]",)]
Q(s: "[" ++ "'; COMMIT; DROP TABLE t; --" ++ "]");
