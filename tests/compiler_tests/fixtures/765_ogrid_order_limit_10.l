# Test: The first 10 of [5, 3, 9, 1, 7], ordered ascending. (from tests/programs/ogrid/order_limit_10.l)

@OrderBy(O, "x");
@Limit(O, 10);
O(x:) :- x in [5, 3, 9, 1, 7];
