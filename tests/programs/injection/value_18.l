# A string that looks like SQL is a value: it comes back unchanged.
# Expect: rows Q = [('\\x27; DROP TABLE t',)]
Q(s: "\x27; DROP TABLE t");
