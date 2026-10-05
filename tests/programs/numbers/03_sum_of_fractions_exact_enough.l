# A sum of fractions.
# Expect: rows N = [(1.0,)]
V(x:) :- x in [0.25, 0.25, 0.5];
N(t? += x) distinct :- V(x:);
