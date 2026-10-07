# Each customer's revenue is the sum of their orders.
# Expect: holds Revenue.definition

@Assert(Revenue, definition: "∀ c, Revenue c = ∑ o, Spend o c");
Spend(order_id: 1, customer_id: 10, amount: 100);
Spend(order_id: 2, customer_id: 10, amount: 50);
Spend(order_id: 3, customer_id: 11, amount: 80);
Revenue(customer_id:, revenue? += amount) distinct :- Spend(customer_id:, amount:);
