---
name: OrdersByStatus
description: Number of orders per status.
---
import concepts.order_status.OrderStatus;
import tables.orders.Orders;

@OrderBy(OrdersByStatus, "status");
OrdersByStatus(status:, count? += 1) distinct :- OrderStatus(status:), Orders(status:);
