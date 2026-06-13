# run: OrderWithTax, ContactableCustomer, Inactive, OrderSize, UserDisplay
@Engine("duckdb");

# Tables
Customers(customer_id: 1, full_name: "Ada Lovelace", email: "ada@example.com", phone: null);
Customers(customer_id: 2, full_name: null, email: null, phone: "555-0102");
Customers(customer_id: 3, full_name: "Grace Hopper", email: "grace@example.com", phone: "555-0103");

Orders(order_id: 10, customer_id: 1, amount: 1500);
Orders(order_id: 11, customer_id: 2, amount: 240);
Orders(order_id: 12, customer_id: 3, amount: 40);

Logins(customer_id: 1);
Logins(customer_id: 3);

# Rules

## Variables are defined with ==.
@OrderBy(OrderWithTax, "order_id");
OrderWithTax(order_id:, total:) :-
  Orders(order_id:, amount:),
  total == amount * 1.10;

## Disjunction (|) with null tests: email when available, otherwise phone.
@OrderBy(ContactableCustomer, "customer_id");
ContactableCustomer(customer_id:, channel:) distinct :-
  Customers(customer_id:, email:), email is not null, channel == "email" |
  Customers(customer_id:, phone:), phone is not null, channel == "phone";

## Negation (~): customers that never logged in.
@OrderBy(Inactive, "customer_id");
Inactive(customer_id:) :- Customers(customer_id:), ~Logins(customer_id:);

## Conditional expression.
@OrderBy(OrderSize, "order_id");
OrderSize(order_id:, size:) :-
  Orders(order_id:, amount:),
  size == (if amount > 1000 then "large"
           else if amount > 100 then "medium"
           else "small");

## Coalesce for null handling.
@OrderBy(UserDisplay, "customer_id");
UserDisplay(customer_id:, name:) :-
  Customers(customer_id:, full_name:),
  name == Coalesce(full_name, "Anonymous");
