# Test: Columns named after SQL keywords. (from tests/programs/execution/73_column_named_like_keyword.l)

@OrderBy(Ordered, "order DESC");
Ordered(order:, group:) :- R(order:, group:) | (order == 3, group == 1);
R(order: 1, group: 2, select: 3);
