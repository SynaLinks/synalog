# The string as a list element.
# Expect: rows Q = [('\\x27; DROP TABLE t',)]
Q(s:) :- s in ["\x27; DROP TABLE t", "other"], s != "other";
