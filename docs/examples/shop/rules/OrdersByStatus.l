---
name: OrdersByStatus
description: Number of orders per status.
---
import concepts.OrderStatus.OrderStatus;
import tables.Orders.Orders;

@OrderBy(OrdersByStatus, "status");
OrdersByStatus(status:, count? += 1) distinct :- OrderStatus(status:), Orders(status:);
