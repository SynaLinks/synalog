# Order 4 references customer 12, who does not exist.
# Expect: violated Order.known_customer 1

@Assert(Order, known_customer: "∀ o c a, Order o c a → ∃ k, Customer c k");
Order(order_id: 1, customer_id: 10, amount: 100);
Order(order_id: 2, customer_id: 10, amount: 50);
Order(order_id: 3, customer_id: 11, amount: 80);
Customer(customer_id: 10, country: "FR");
Customer(customer_id: 11, country: "US");
Order(order_id: 4, customer_id: 12, amount: 20);
