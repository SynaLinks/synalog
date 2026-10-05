# The string in a record, read back.
# Expect: rows Q = [('a\tb',)]
R(r: {v: 'a\tb'});
Q(s: r.v) :- R(r:);
