# The size of a collected list, duplicates included.
# Expect: rows A = [(3,)]
V(x: 1);
V(x: 1);
V(x: 2);
L(l? List= x) distinct :- V(x:);
A(n: Size(l)) :- L(l:);
