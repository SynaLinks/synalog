# The string in a record, read back.
# Expect: rows Q = [('/* comment */ x',)]
R(r: {v: "/* comment */ x"});
Q(s: r.v) :- R(r:);
