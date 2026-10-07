# Test: Negation of a predicate named after a SQL keyword. (from tests/programs/execution/71_negation_keyword_names.l)

Item(x:) :- x in [1, 2];
Order(x: 1);
Free(x:) :- Item(x:), ~Order(x:);
