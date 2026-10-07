# Every order references a known customer.
# Expect: holds Order.known_customer

@Assert(Order, known_customer: "∀ o c a, Order o c a → ∃ k, Customer c k");
Order(order_id: 1, customer_id: 10, amount: 100);
Order(order_id: 2, customer_id: 10, amount: 50);
Order(order_id: 3, customer_id: 11, amount: 80);
Customer(customer_id: 10, country: "FR");
Customer(customer_id: 11, country: "US");
