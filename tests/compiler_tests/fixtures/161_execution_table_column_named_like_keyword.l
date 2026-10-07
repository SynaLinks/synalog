# Test: A value from a column named after a keyword, used in a join and a filter. (from tests/programs/execution/78_table_column_named_like_keyword.l)

Line(order: 10, select: "paid");
Line(order: 11, select: "open");
Paid(order:) :- Line(order:, select: "paid");
