# The inner join drops order 3, which has no quantity: the sum disagrees.
# Expect: violated Revenue.all_orders 1
@Assert(Revenue, all_orders: "Revenue = ∑ o, Price o");
Price(order_id: 1, price: 4);
Price(order_id: 2, price: 5);
Price(order_id: 3, price: 6);
Qty(order_id: 1, qty: 1);
Qty(order_id: 2, qty: 1);
Revenue(r? += price * qty) distinct :- Price(order_id:, price:), Qty(order_id:, qty:);
