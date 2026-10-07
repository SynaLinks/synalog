# Equal records are one row under distinct.
# Expect: rows R = [(1,)]
V(r: {a: 1});
V(r: {a: 1});
D(r:) distinct :- V(r:);
R(n? += 1) distinct :- D(r:);
