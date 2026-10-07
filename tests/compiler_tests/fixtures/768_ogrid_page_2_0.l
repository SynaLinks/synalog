# Test: A page of 2 after 0 rows. (from tests/programs/ogrid/page_2_0.l)

@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
