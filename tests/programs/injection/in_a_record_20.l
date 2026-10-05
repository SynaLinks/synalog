# The string in a record, read back.
# Expect: rows Q = [('{x}; DROP',)]
R(r: {v: "{x}; DROP"});
Q(s: r.v) :- R(r:);
