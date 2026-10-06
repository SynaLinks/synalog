# Test: A local variable compared with an outer one. (from tests/programs/logic/negation_local_compared_to_outer.l)

N(x:) :- x in [1, 2];
E(a: 1, b: 0);
E(a: 2, b: 5);
Q(x:) :- N(x:), ~(E(a: x, b: y), y < x);
