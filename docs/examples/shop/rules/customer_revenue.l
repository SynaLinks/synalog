---
name: CustomerRevenue
description: Total amount ordered by each customer, all statuses included.
keywords: [revenue, spend, sales]
---
import concepts.customer.Customer;
import tables.orders.Orders;

@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :-
  Customer(customer_id:), Orders(customer_id:, amount:);
