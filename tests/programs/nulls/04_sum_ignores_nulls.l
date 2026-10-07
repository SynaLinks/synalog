# A sum skips nulls.
# Expect: rows N = [(3,)]
V(x: 1);
V(x: null);
V(x: 2);
N(t? += x) distinct :- V(x:);
