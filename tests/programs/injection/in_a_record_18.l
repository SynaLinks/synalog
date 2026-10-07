# The string in a record, read back.
# Expect: rows Q = [('\\x27; DROP TABLE t',)]
R(r: {v: "\x27; DROP TABLE t"});
Q(s: r.v) :- R(r:);
