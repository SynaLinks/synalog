# Test: Negating a predicate of two rules. (from tests/programs/negation/10_negation_of_a_union.l)

V(x:) :- x in [1, 2, 3];
U(x: 1);
U(x: 2);
N(x:) :- V(x:), ~U(x:);
