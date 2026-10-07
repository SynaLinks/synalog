# The predicate exists, but one the statement names does not yet.
# Expect: status Order.known pending
# Expect: valid
@Assert(Order, known: "∀ o c, Order o c → ∃ k, Customer c k");
Order(order_id: 1, customer_id: 10);
