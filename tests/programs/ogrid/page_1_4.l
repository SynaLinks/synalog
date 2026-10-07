# A page of 1 after 4 rows.
# Expect: page O 1 4 = [(9,)]
@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
