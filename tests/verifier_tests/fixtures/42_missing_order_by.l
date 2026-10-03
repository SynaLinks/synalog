---
name: TopCustomers
description: The ten customers who spent the most.
---
# Verifier Test: the named predicate is not ordered
# Expected Error: OrderByError.missingOrderBy
#
# The front matter says this file is about TopCustomers: it is what runs,
# and what runs is paginated. Without @OrderBy its rows come back in any
# order, so the same page differs between runs. The helper Spent needs none.

Orders(customer_id:, amount:) :- customer_id in Range(20), amount == customer_id * 10;

Spent(customer_id:, spent? += amount) distinct :- Orders(customer_id:, amount:);

# ERROR: no @OrderBy(TopCustomers, ...)
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, spent:) :- Spent(customer_id:, spent:);
