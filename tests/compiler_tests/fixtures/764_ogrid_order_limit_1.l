# Test: The first 1 of [5, 3, 9, 1, 7], ordered ascending. (from tests/programs/ogrid/order_limit_1.l)

@OrderBy(O, "x");
@Limit(O, 1);
O(x:) :- x in [5, 3, 9, 1, 7];
