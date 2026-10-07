# Test: The string concatenated around. (from tests/programs/injection/concatenated_18.l)

Q(s: "[" ++ "\x27; DROP TABLE t" ++ "]");
