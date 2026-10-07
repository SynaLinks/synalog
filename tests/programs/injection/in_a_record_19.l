# The string in a record, read back.
# Expect: rows Q = [('%_\\%',)]
R(r: {v: "%_\%"});
Q(s: r.v) :- R(r:);
