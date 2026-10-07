# Test: A page of ordered rows. (from tests/programs/ordering/07_page.l)

@OrderBy(O, "x");
O(x:) :- x in [40, 10, 30, 20];
