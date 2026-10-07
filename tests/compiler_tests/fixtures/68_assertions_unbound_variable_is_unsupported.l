# Test: x ranges over nothing. (from tests/programs/assertions/28_unbound_variable_is_unsupported.l)

@Assert(Order, free: "∀ x, x > 0");
Order(order_id: 1, amount: 10);
