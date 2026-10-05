WITH t_1_Orders AS (SELECT * FROM VALUES
  (1, 101, "P1"),
  (2, 102, "P2"),
  (3, 101, "P3")
AS UNUSED_TABLE_NAME(order_id, customer_id, product_id)),
t_2_Customers AS (SELECT * FROM VALUES
  (101, "Alice"),
  (102, "Bob")
AS UNUSED_TABLE_NAME(customer_id, name)),
t_3_Products AS (SELECT * FROM VALUES
  ("P1", 100),
  ("P2", 200),
  ("P3", 150)
AS UNUSED_TABLE_NAME(product_id, price)),
t_0_OrderDetails AS (SELECT
  Orders.order_id AS order_id,
  Customers.name AS customer_name,
  Orders.product_id AS product_id,
  Products.price AS price
FROM
  t_1_Orders AS Orders, t_2_Customers AS Customers, t_3_Products AS Products
WHERE
  (Customers.customer_id = Orders.customer_id) AND
  (Products.product_id = Orders.product_id) ORDER BY order_id NULLS LAST)
SELECT
  OrderDetails.order_id AS order_id,
  OrderDetails.customer_name AS customer_name,
  OrderDetails.price AS price
FROM
  t_0_OrderDetails AS OrderDetails ORDER BY order_id NULLS LAST;