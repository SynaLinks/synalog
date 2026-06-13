# Test: Named arguments with renaming

# Data with named columns
Orders(order_id: 1, customer_id: 101, amount: 50, status: "shipped");
Orders(order_id: 2, customer_id: 102, amount: 75, status: "pending");
Orders(order_id: 3, customer_id: 101, amount: 100, status: "shipped");
Orders(order_id: 4, customer_id: 103, amount: 25, status: "cancelled");

Customers(customer_id: 101, name: "Alice", tier: "gold");
Customers(customer_id: 102, name: "Bob", tier: "silver");
Customers(customer_id: 103, name: "Charlie", tier: "bronze");

# Rename column to variable
OrderAmounts(oid, amt) :-
  Orders(order_id: oid, customer_id: cid, amount: amt, status: s);

# Shorthand (column name = variable name)
ShippedOrders(order_id:, amount:) :-
  Orders(order_id:, customer_id:, amount:, status: "shipped");

# Mix of rename and shorthand
CustomerOrders(cust_name, order_amt, order_status) :-
  Orders(order_id:, customer_id: cid, amount: order_amt, status: order_status),
  Customers(customer_id: cid, name: cust_name, tier:);

# Multiple renames in join
DetailedOrders(oid, cname, ctier, oamt) :-
  Orders(order_id: oid, customer_id: cid, amount: oamt, status:),
  Customers(customer_id: cid, name: cname, tier: ctier);

@OrderBy(Test, "oid");
Test(oid:, cname:, oamt:) :- DetailedOrders(oid, cname, ctier, oamt);
