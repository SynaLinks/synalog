# Test: Three-way join

Orders(order_id: 1, customer_id: 101, product_id: "P1");
Orders(order_id: 2, customer_id: 102, product_id: "P2");
Orders(order_id: 3, customer_id: 101, product_id: "P3");

Customers(customer_id: 101, name: "Alice");
Customers(customer_id: 102, name: "Bob");

Products(product_id: "P1", price: 100);
Products(product_id: "P2", price: 200);
Products(product_id: "P3", price: 150);

# Three-way join
@OrderBy(OrderDetails, "order_id");
OrderDetails(order_id:, customer_name: name, product_id:, price:) :-
  Orders(order_id:, customer_id:, product_id:),
  Customers(customer_id:, name:),
  Products(product_id:, price:);

@OrderBy(Test, "order_id");
Test(order_id:, customer_name:, price:) :- OrderDetails(order_id:, customer_name:, product_id:, price:);
