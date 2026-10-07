# Test: A page of 3 after 5 rows. (from tests/programs/ogrid/page_3_5.l)

@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
