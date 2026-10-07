# A value from the fields of {a: 1.5}.
# Expect: rows R = [(3.0,)]
V(r: {a: 1.5});
R(v: r.a * 2) :- V(r:);
