# The string in a record, read back.
# Expect: rows Q = [('0x27 OR 1',)]
R(r: {v: "0x27 OR 1"});
Q(s: r.v) :- R(r:);
