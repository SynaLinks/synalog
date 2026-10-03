# x ranges over nothing.
# Expect: status Order.free unsupported
# Expect: warning cannot be checked
# Expect: valid

@Assert(Order, free: "∀ x, x > 0");
Order(order_id: 1, amount: 10);
