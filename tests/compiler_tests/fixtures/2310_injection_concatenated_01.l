# Test: The string concatenated around. (from tests/programs/injection/concatenated_01.l)

Q(s: "[" ++ '"; DROP TABLE t; --' ++ "]");
