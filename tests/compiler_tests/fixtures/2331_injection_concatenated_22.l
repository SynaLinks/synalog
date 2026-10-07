# Test: The string concatenated around. (from tests/programs/injection/concatenated_22.l)

Q(s: "[" ++ "’; DROP TABLE t; --" ++ "]");
