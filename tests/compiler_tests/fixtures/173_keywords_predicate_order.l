# Test:  (from tests/programs/keywords/01_predicate_order.l)

@OrderBy(Order, "x");
Order(x:) :- x in [2, 1];
