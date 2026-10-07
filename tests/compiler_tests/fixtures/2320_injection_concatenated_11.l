# Test: The string concatenated around. (from tests/programs/injection/concatenated_11.l)

Q(s: "[" ++ "$$; DROP TABLE t; $$" ++ "]");
