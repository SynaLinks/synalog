# Aggregating an expression.
# Expect: rows T = [(28,)]
Line(qty: 2, price: 5);
Line(qty: 3, price: 6);
T(t? += qty * price) distinct :- Line(qty:, price:);
