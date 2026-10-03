---
description: The ten customers who spent the most.
---
# Verifier Test: front matter without a name
# Expected Error: NameError.missingName
#
# The front matter describes the rows but does not say which predicate the
# file is about: Orders and TopCustomers are both defined, and nothing says
# which one runs.

Orders(customer_id:, amount:) :- customer_id in Range(20), amount == customer_id * 10;

@OrderBy(TopCustomers, "spent", "DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, spent? += amount) distinct :- Orders(customer_id:, amount:);
