# ∑ over an arithmetic term.
# Expect: holds Revenue.definition
@Assert(Revenue, definition: "Revenue = ∑ o, Price o * Qty o");
Price(order_id: 1, price: 4);
Price(order_id: 2, price: 5);
Qty(order_id: 1, qty: 3);
Qty(order_id: 2, qty: 2);
Revenue(r? += price * qty) distinct :- Price(order_id:, price:), Qty(order_id:, qty:);
