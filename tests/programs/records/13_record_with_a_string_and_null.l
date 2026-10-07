# A record with a null field.
# Expect: rows R = [("a", None)]
V(r: {s: "a", n: null});
R(s: r.s, n: r.n) :- V(r:);
