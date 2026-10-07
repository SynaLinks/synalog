# The string in a record, read back.
# Expect: rows Q = [("'; COMMIT; DROP TABLE t; --",)]
R(r: {v: "'; COMMIT; DROP TABLE t; --"});
Q(s: r.v) :- R(r:);
