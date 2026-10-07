# Test: A page of 1 after 4 rows. (from tests/programs/ogrid/page_1_4.l)

@OrderBy(O, "x");
O(x:) :- x in [5, 3, 9, 1, 7];
