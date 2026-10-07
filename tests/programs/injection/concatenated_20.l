# The string concatenated around.
# Expect: rows Q = [('[{x}; DROP]',)]
Q(s: "[" ++ "{x}; DROP" ++ "]");
