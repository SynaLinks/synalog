# Test: The first rows in order. (from tests/programs/ordering/03_limit_after_order.l)

@OrderBy(O, "x");
@Limit(O, 2);
O(x:) :- x in [5, 2, 1, 4];
