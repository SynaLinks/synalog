# Ordering by a boolean column: false first.
# Expect: rows O = [(1, False), (5, True)]
V(x:) :- x in [5, 1];
@OrderBy(O, "big");
O(x:, big: x > 3) :- V(x:);
