# The string in a record, read back.
# Expect: rows Q = [('\\\\',)]
R(r: {v: "\\"});
Q(s: r.v) :- R(r:);
