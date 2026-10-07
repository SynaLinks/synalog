# Min= over [4, 1, 7, 1].
# Expect: rows A = [(1,)]
V(x:) :- x in [4, 1, 7, 1];
A(v? Min= x) distinct :- V(x:);
