# The string in a record, read back.
# Expect: rows Q = [("') UNION SELECT 1 --",)]
R(r: {v: "') UNION SELECT 1 --"});
Q(s: r.v) :- R(r:);
