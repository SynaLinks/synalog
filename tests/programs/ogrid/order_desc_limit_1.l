# The first 1 of [5, 3, 9, 1, 7], ordered desc.
# Expect: rows O = [(9,)]
@OrderBy(O, "x desc");
@Limit(O, 1);
O(x:) :- x in [5, 3, 9, 1, 7];
