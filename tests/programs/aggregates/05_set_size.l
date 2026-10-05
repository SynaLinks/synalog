# The size of a collected set: no duplicates.
# Expect: rows A = [(2,)]
V(x: 1);
V(x: 1);
V(x: 2);
L(l? Set= x) distinct :- V(x:);
A(n: Size(l)) :- L(l:);
