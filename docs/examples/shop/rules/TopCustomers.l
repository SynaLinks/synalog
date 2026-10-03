---
name: TopCustomers
description: The two customers with the highest revenue.
keywords: [best customers, ranking]
---
import rules.CustomerRevenue.CustomerRevenue;

@OrderBy(TopCustomers, "total", "DESC");
@Limit(TopCustomers, 2);
TopCustomers(customer_id:, total:) :- CustomerRevenue(customer_id:, total:);
