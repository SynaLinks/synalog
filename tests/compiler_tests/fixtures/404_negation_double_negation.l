# Test: The complement of a complement. (from tests/programs/negation/07_double_negation.l)

V(x:) :- x in [1, 2];
B(x: 2);
NotB(x:) :- V(x:), ~B(x:);
N(x:) :- V(x:), ~NotB(x:);
