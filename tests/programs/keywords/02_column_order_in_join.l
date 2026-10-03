# A join on a column named order.
# Expect: rows J = [(1, "a")]
L(order: 1, v: "a");
M(order: 1);
M(order: 2);
J(order:, v:) :- L(order:, v:), M(order:);
