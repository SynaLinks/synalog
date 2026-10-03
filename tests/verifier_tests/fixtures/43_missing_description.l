---
name: TopCustomers
description: "  "
---
# Verifier Test: front matter without a description
# Expected Error: DescriptionError.missingDescription
#
# Front matter says what a file is: its name, and what the rows are. Here
# the description is blank, so nothing says what TopCustomers holds, and a
# search for "best customers" or "biggest spenders" would never find it.

Orders(customer_id:, amount:) :- customer_id in Range(20), amount == customer_id * 10;

@OrderBy(TopCustomers, "spent", "DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, spent? += amount) distinct :- Orders(customer_id:, amount:);
