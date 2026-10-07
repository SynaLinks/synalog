# A sum of floats.
# Expect: rows T = [(0.6,)]
V(x:) :- x in [0.1, 0.2, 0.3];
T(t? += x) distinct :- V(x:);
