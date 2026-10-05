# Test: Negating a predicate matched on a constant and a variable. (from tests/programs/negation/16_negation_with_a_constant_and_a_variable.l)

V(g: "a", x: 1);
V(g: "a", x: 2);
Done(g: "a", x: 1);
N(g:, x:) :- V(g:, x:), ~Done(g:, x:);
