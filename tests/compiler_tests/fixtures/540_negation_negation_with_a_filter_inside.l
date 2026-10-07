# Test: Negating a filtered predicate. (from tests/programs/negation/11_negation_with_a_filter_inside.l)

V(x:) :- x in [1, 2, 3];
Big(x:) :- V(x:), x > 2;
@OrderBy(N, "x");
N(x:) :- V(x:), ~Big(x:);
