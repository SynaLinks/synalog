# Test: Ordering by a boolean column: false first. (from tests/programs/ordering/12_order_by_a_boolean.l)

V(x:) :- x in [5, 1];
@OrderBy(O, "big");
O(x:, big: x > 3) :- V(x:);
