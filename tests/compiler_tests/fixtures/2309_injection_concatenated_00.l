# Test: The string concatenated around. (from tests/programs/injection/concatenated_00.l)

Q(s: "[" ++ "'; DROP TABLE t; --" ++ "]");
