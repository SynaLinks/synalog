# A page of 2 after 3 rows.
# Expect: page O 2 3 = [(7,), (9,)]
@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
