# run: Customer, OrderStatus, OrdersByStatus, CustomerRevenue, TopCustomers
@Engine("duckdb");

# Tables
Orders(order_id: 1, customer_id: 100, amount: 250, status: "shipped");
Orders(order_id: 2, customer_id: 100, amount: 1200, status: "pending");
Orders(order_id: 3, customer_id: 200, amount: 80, status: "shipped");
Orders(order_id: 4, customer_id: 300, amount: 430, status: "cancelled");
Orders(order_id: 5, customer_id: 200, amount: 95, status: "shipped");

# Concepts

## Customers that placed at least one order.
@OrderBy(Customer, "customer_id");
Customer(customer_id:) distinct :- Orders(customer_id:);

## Distinct order statuses (categorical values extracted first).
@OrderBy(OrderStatus, "status");
OrderStatus(status:) distinct :- Orders(status:);

# Rules

## Number of orders per status.
@OrderBy(OrdersByStatus, "status");
OrdersByStatus(status:, count? += 1) distinct :- OrderStatus(status:), Orders(status:);

## Total revenue per customer; defined once, reused below.
@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);

## Top customers build on CustomerRevenue instead of recomputing it.
@OrderBy(TopCustomers, "total", "DESC");
@Limit(TopCustomers, 2);
TopCustomers(customer_id:, total:) :- CustomerRevenue(customer_id:, total:);
