# Ordering by a computed column.
# Expect: rows O = [(3, -3), (2, -2), (1, -1)]
@OrderBy(O, "y");
O(x:, y: -x) :- x in [1, 2, 3];
