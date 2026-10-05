# Avg= over [4, 1, 7, 1].
# Expect: rows A = [(3.25,)]
V(x:) :- x in [4, 1, 7, 1];
A(v? Avg= x) distinct :- V(x:);
