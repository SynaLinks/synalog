---
name: Customer
description: Every customer who placed at least one order.
keywords: [customer, buyer, client]
---
import tables.Orders.Orders;

@OrderBy(Customer, "customer_id");
Customer(customer_id:) distinct :- Orders(customer_id:);
