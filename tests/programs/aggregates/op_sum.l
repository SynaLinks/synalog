# += over [4, 1, 7, 1].
# Expect: rows A = [(13,)]
V(x:) :- x in [4, 1, 7, 1];
A(v? += x) distinct :- V(x:);
