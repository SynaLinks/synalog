# List= collects every value.
# Expect: rows N = [(3,)]
V(x:) :- x in [1, 1, 2];
L(l? List= x) distinct :- V(x:);
N(n: Size(l)) :- L(l:);
