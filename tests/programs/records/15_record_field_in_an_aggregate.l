# Summing a record field.
# Expect: rows R = [(5,)]
V(r: {a: 2});
V(r: {a: 3});
R(t? += r.a) distinct :- V(r:);
