# A delivered order has a positive amount.
# Expect: holds Delivery.positive

@Assert(Delivery, positive: """∀ o, Status o = "delivered" → Amount o > 0""");
Status(order_id: 1, status: "delivered");
Status(order_id: 2, status: "cancelled");
Amount(order_id: 1, amount: 10);
Amount(order_id: 2, amount: 0);
Delivery(order_id:) :- Status(order_id:, status: "delivered");
