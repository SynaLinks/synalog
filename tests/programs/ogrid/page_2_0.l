# A page of 2 after 0 rows.
# Expect: page O 2 0 = [(1,), (3,)]
@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
