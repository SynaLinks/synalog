# Test: The string concatenated around. (from tests/programs/injection/concatenated_04.l)

Q(s: "[" ++ "\'; DROP TABLE t; --" ++ "]");
