# Three negations deep.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 2];
A(x: 1);
NotA(x:) :- V(x:), ~A(x:);
NotNotA(x:) :- V(x:), ~NotA(x:);
N(x:) :- V(x:), ~NotNotA(x:);
