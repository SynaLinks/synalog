# Test: The string concatenated around. (from tests/programs/injection/concatenated_10.l)

Q(s: "[" ++ "'; COMMIT; DROP TABLE t; --" ++ "]");
