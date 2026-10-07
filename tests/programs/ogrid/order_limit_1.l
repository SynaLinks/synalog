# The first 1 of [5, 3, 9, 1, 7], ordered ascending.
# Expect: rows O = [(1,)]
@OrderBy(O, "x");
@Limit(O, 1);
O(x:) :- x in [5, 3, 9, 1, 7];
