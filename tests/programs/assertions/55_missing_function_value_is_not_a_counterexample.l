# Order 3 has no quantity: Qty 3 is undefined, so the equation is not checked there.
# Expect: holds Total.definition
@Assert(Total, definition: "∀ o, Total o = Price o * Qty o");
Price(order_id: 1, price: 4);
Price(order_id: 3, price: 6);
Qty(order_id: 1, qty: 3);
Total(order_id: 1, total: 12);
