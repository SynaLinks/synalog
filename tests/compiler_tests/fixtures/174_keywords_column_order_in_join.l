# Test: A join on a column named order. (from tests/programs/keywords/02_column_order_in_join.l)

L(order: 1, v: "a");
M(order: 1);
M(order: 2);
J(order:, v:) :- L(order:, v:), M(order:);
