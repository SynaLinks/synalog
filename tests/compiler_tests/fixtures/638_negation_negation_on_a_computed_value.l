# Test: Negating with a computed value. (from tests/programs/negation/15_negation_on_a_computed_value.l)

V(x:) :- x in [1, 2, 3];
Even(x:) :- V(x:), x % 2 == 0;
@OrderBy(N, "x");
N(x:) :- V(x:), ~Even(x: x);
