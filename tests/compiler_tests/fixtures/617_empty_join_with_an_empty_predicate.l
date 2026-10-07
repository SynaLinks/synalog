# Test: A join with a predicate that has no rows has no rows. (from tests/programs/empty/01_join_with_an_empty_predicate.l)

A(x:) :- x in [1, 2];
B(x:) :- x in [1], x > 5;
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
