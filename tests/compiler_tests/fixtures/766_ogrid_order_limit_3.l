# Test: The first 3 of [5, 3, 9, 1, 7], ordered ascending. (from tests/programs/ogrid/order_limit_3.l)

@OrderBy(O, "x");
@Limit(O, 3);
O(x:) :- x in [5, 3, 9, 1, 7];
