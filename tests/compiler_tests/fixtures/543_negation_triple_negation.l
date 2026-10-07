# Test: Three negations deep. (from tests/programs/negation/14_triple_negation.l)

V(x:) :- x in [1, 2];
A(x: 1);
NotA(x:) :- V(x:), ~A(x:);
NotNotA(x:) :- V(x:), ~NotA(x:);
N(x:) :- V(x:), ~NotNotA(x:);
