# An aggregate by key has one value per key.
# Expect: holds Revenue.key

@Assert(Revenue, key: "∀ c r s, Revenue c r → Revenue c s → r = s");
Order(order_id: 1, customer_id: 10, amount: 100);
Order(order_id: 2, customer_id: 10, amount: 50);
Order(order_id: 3, customer_id: 11, amount: 80);
Customer(customer_id: 10, country: "FR");
Customer(customer_id: 11, country: "US");
Revenue(customer_id:, revenue? += amount) distinct :- Order(customer_id:, amount:);
