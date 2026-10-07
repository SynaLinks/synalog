# A value from the fields of {n: {m: 4}}.
# Expect: rows R = [(8,)]
V(r: {n: {m: 4}});
R(v: r.n.m * 2) :- V(r:);
