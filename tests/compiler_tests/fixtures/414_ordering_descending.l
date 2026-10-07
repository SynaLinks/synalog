# Test: Ordering descending. (from tests/programs/ordering/01_descending.l)

@OrderBy(O, "x desc");
O(x:) :- x in [2, 3, 1];
