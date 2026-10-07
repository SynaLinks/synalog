# Max= over [4, 1, 7, 1].
# Expect: rows A = [(7,)]
V(x:) :- x in [4, 1, 7, 1];
A(v? Max= x) distinct :- V(x:);
