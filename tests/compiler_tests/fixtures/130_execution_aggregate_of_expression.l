# Test: Aggregating an expression. (from tests/programs/execution/47_aggregate_of_expression.l)

Line(qty: 2, price: 5);
Line(qty: 3, price: 6);
T(t? += qty * price) distinct :- Line(qty:, price:);
