---
name: CustomerRevenue
description: Total amount ordered by each customer, all statuses included.
keywords: [revenue, spend, sales]
---
import concepts.Customer.Customer;
import tables.Orders.Orders;

@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :-
  Customer(customer_id:), Orders(customer_id:, amount:);
