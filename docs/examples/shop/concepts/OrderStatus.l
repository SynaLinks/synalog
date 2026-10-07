---
name: OrderStatus
description: The statuses an order can have (shipped, pending, cancelled).
---
import tables.Orders.Orders;

@OrderBy(OrderStatus, "status");
OrderStatus(status:) distinct :- Orders(status:);
