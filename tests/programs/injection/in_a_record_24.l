# The string in a record, read back.
# Expect: rows Q = [("'+(SELECT 1)+'",)]
R(r: {v: "'+(SELECT 1)+'"});
Q(s: r.v) :- R(r:);
