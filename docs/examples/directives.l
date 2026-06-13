# run: TopCustomers
@Engine("duckdb");

# Tables
Orders(customer_id: 100, amount: 250);
Orders(customer_id: 100, amount: 1200);
Orders(customer_id: 200, amount: 80);
Orders(customer_id: 300, amount: 430);
Orders(customer_id: 400, amount: 990);

# Rules

## Directives go BEFORE the rule they apply to.
@OrderBy(TopCustomers, "total", "DESC");
@Limit(TopCustomers, 3);
TopCustomers(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
