---
name: Orders
description: One row per order, with its customer, amount and status.
---
@OrderBy(Orders, "order_id");
Orders(order_id:, customer_id:, amount:, status:) :-
  orders(order_id:, customer_id:, amount:, status:);
