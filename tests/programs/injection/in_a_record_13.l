# The string in a record, read back.
# Expect: rows Q = [('`; DROP TABLE t; `',)]
R(r: {v: "`; DROP TABLE t; `"});
Q(s: r.v) :- R(r:);
