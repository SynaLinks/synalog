WITH t_0_Orders AS (SELECT * FROM VALUES
  (1, 101, 50, "shipped"),
  (2, 102, 75, "pending"),
  (3, 101, 100, "shipped"),
  (4, 103, 25, "cancelled")
AS UNUSED_TABLE_NAME(order_id, customer_id, amount, status)),
t_1_Customers AS (SELECT * FROM VALUES
  (101, "Alice", "gold"),
  (102, "Bob", "silver"),
  (103, "Charlie", "bronze")
AS UNUSED_TABLE_NAME(customer_id, name, tier))
SELECT
  Orders.order_id AS oid,
  Customers.name AS cname,
  Orders.amount AS oamt
FROM
  t_0_Orders AS Orders, t_1_Customers AS Customers
WHERE
  (Customers.customer_id = Orders.customer_id) ORDER BY oid NULLS LAST;