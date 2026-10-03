# A statement that does not parse.
# Expect: error Invalid assertion 'Order.broken'

@Assert(Order, broken: "∀ x, Order x →");
Order(order_id: 1, amount: 10);
