# A raw table name is not a predicate: it reads as a variable.
# Expect: error Invalid assertion
@Assert(Order, raw: "∀ o, orders o → Order o");
Order(order_id: 1, amount: 3);
