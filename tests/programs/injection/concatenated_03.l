# The string concatenated around.
# Expect: rows Q = [("[') UNION SELECT 1 --]",)]
Q(s: "[" ++ "') UNION SELECT 1 --" ++ "]");
