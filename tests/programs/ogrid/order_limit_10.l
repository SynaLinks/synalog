# The first 10 of [5, 3, 9, 1, 7], ordered ascending.
# Expect: rows O = [(1,), (3,), (5,), (7,), (9,)]
@OrderBy(O, "x");
@Limit(O, 10);
O(x:) :- x in [5, 3, 9, 1, 7];
