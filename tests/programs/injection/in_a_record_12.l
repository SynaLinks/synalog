# The string in a record, read back.
# Expect: rows Q = [("E'\\''",)]
R(r: {v: "E'\''"});
Q(s: r.v) :- R(r:);
