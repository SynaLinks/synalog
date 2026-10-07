# Total is off by one for both orders.
# Expect: violated Total.definition 2
# Expect: counterexamples Total.definition = [(1,), (2,)]

@Assert(Total, definition: "∀ o, Total o = Price o * Qty o");
Price(order_id: 1, price: 4);
Price(order_id: 2, price: 5);
Qty(order_id: 1, qty: 3);
Qty(order_id: 2, qty: 2);
Total(order_id:, total:) :- Price(order_id:, price:), Qty(order_id:, qty:), total == price * qty + 1;
