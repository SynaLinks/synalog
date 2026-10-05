# Test: The string concatenated around. (from tests/programs/injection/concatenated_16.l)

Q(s: "[" ++ "' || (SELECT 1) || '" ++ "]");
