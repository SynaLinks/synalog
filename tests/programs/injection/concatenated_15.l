# The string concatenated around.
# Expect: rows Q = [("[');ATTACH DATABASE 'x' AS y;--]",)]
Q(s: "[" ++ "');ATTACH DATABASE 'x' AS y;--" ++ "]");
