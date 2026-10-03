# Test: The predicate exists, but one the statement names does not yet. (from tests/programs/assertions/65_pending_on_missing_helper.l)

@Assert(Order, known: "∀ o c, Order o c → ∃ k, Customer c k");
Order(order_id: 1, customer_id: 10);
