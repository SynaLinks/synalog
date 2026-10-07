# Test: The string concatenated around. (from tests/programs/injection/concatenated_13.l)

Q(s: "[" ++ "`; DROP TABLE t; `" ++ "]");
