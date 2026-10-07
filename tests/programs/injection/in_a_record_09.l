# The string in a record, read back.
# Expect: rows Q = [('-- comment',)]
R(r: {v: "-- comment"});
Q(s: r.v) :- R(r:);
