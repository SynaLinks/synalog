# The string concatenated around.
# Expect: rows Q = [('[\\x27; DROP TABLE t]',)]
Q(s: "[" ++ "\x27; DROP TABLE t" ++ "]");
