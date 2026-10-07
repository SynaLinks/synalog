# Test: ORDER BY a keyword column, descending. (from tests/programs/keywords/07_keyword_column_in_order_by_desc.l)

@OrderBy(R, "order DESC");
R(order:) :- order in [2, 3, 1];
