# Ordering descending.
# Expect: rows O = [(3,), (2,), (1,)]
@OrderBy(O, "x desc");
O(x:) :- x in [2, 3, 1];
