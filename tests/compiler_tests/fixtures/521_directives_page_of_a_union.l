# Test: A page of a predicate of two rules. (from tests/programs/directives/29_page_of_a_union.l)

@OrderBy(U, "x");
U(x:) :- x in [1, 3];
U(x:) :- x in [2, 4];
