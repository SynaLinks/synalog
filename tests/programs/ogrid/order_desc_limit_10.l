# The first 10 of [5, 3, 9, 1, 7], ordered desc.
# Expect: rows O = [(9,), (7,), (5,), (3,), (1,)]
@OrderBy(O, "x desc");
@Limit(O, 10);
O(x:) :- x in [5, 3, 9, 1, 7];
