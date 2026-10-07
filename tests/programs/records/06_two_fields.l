# Reading both fields of a record.
# Expect: rows R = [(1, "a")]
V(r: {n: 1, s: "a"});
R(n: r.n, s: r.s) :- V(r:);
