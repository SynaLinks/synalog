# The string concatenated around.
# Expect: rows Q = [('[/* comment */ x]',)]
Q(s: "[" ++ "/* comment */ x" ++ "]");
