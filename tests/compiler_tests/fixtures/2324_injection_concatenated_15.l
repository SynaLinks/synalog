# Test: The string concatenated around. (from tests/programs/injection/concatenated_15.l)

Q(s: "[" ++ "');ATTACH DATABASE 'x' AS y;--" ++ "]");
