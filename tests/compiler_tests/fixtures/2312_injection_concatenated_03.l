# Test: The string concatenated around. (from tests/programs/injection/concatenated_03.l)

Q(s: "[" ++ "') UNION SELECT 1 --" ++ "]");
