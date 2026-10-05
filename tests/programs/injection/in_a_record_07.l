# The string in a record, read back.
# Expect: rows Q = [('a\\',)]
R(r: {v: "a\"});
Q(s: r.v) :- R(r:);
