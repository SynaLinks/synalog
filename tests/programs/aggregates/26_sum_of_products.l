# Summing products of two columns.
# Expect: rows A = [(11,)]
V(p: 2, q: 3);
V(p: 1, q: 5);
A(t? += p * q) distinct :- V(p:, q:);
