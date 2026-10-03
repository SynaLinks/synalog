# Test: A predicate named after a SQL keyword. (from tests/programs/execution/23_predicate_named_order.l)

@OrderBy(Order, "x");
Order(x:) :- x in [2, 1];
