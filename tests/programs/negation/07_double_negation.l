# The complement of a complement.
# Expect: rows N = [(2,)]
V(x:) :- x in [1, 2];
B(x: 2);
NotB(x:) :- V(x:), ~B(x:);
N(x:) :- V(x:), ~NotB(x:);
