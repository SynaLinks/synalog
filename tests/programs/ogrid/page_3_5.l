# A page of 3 after 5 rows.
# Expect: page O 3 5 = []
@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
