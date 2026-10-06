# A local variable compared with an outer one.
# Expect: rows Q = [(2,)]
N(x:) :- x in [1, 2];
E(a: 1, b: 0);
E(a: 2, b: 5);
Q(x:) :- N(x:), ~(E(a: x, b: y), y < x);
