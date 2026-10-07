# The first rows in order.
# Expect: rows O = [(1,), (2,)]
@OrderBy(O, "x");
@Limit(O, 2);
O(x:) :- x in [5, 2, 1, 4];
