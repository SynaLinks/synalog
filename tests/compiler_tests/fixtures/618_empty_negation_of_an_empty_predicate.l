# Test: Negating a predicate with no rows keeps every row. (from tests/programs/empty/02_negation_of_an_empty_predicate.l)

A(x:) :- x in [1, 2];
B(x:) :- x in [1], x > 5;
@OrderBy(N, "x");
N(x:) :- A(x:), ~B(x:);
