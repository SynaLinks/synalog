# A field of a nested record.
# Expect: rows R = [(5,)]
V(r: {a: {b: 5}});
R(v: r.a.b) :- V(r:);
