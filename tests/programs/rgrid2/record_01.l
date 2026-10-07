# A value from the fields of {a: 1, b: 2}.
# Expect: rows R = [(3,)]
V(r: {a: 1, b: 2});
R(v: r.a + r.b) :- V(r:);
