# The first 3 of [5, 3, 9, 1, 7], ordered desc.
# Expect: rows O = [(9,), (7,), (5,)]
@OrderBy(O, "x desc");
@Limit(O, 3);
O(x:) :- x in [5, 3, 9, 1, 7];
