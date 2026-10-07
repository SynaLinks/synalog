# The string concatenated around.
# Expect: rows Q = [('["; DROP TABLE t; --]',)]
Q(s: "[" ++ '"; DROP TABLE t; --' ++ "]");
