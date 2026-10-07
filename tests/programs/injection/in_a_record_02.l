# The string in a record, read back.
# Expect: rows Q = [("x' OR '1'='1",)]
R(r: {v: "x' OR '1'='1"});
Q(s: r.v) :- R(r:);
