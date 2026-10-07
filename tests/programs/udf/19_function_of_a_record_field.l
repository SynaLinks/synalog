# A function of a record field.
# Expect: rows S = [(6,)]
Triple(x) = 3 * x;
V(r: {a: 2});
S(v: Triple(r.a)) :- V(r:);
