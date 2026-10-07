# Test: Negating an aggregated predicate. (from tests/programs/negation/08_negation_of_an_aggregate.l)

V(g: "a", x: 5);
V(g: "a", x: 6);
V(g: "b", x: 1);
Big(g:) distinct :- V(g:, x:), x > 4;
G(g:) distinct :- V(g:);
N(g:) :- G(g:), ~Big(g:);
