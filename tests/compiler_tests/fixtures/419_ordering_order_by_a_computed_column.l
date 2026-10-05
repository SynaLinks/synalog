# Test: Ordering by a computed column. (from tests/programs/ordering/06_order_by_a_computed_column.l)

@OrderBy(O, "y");
O(x:, y: -x) :- x in [1, 2, 3];
