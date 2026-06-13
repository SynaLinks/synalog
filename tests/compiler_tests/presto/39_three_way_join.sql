WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS order_id,
      101 AS customer_id,
      'P1' AS product_id
   UNION ALL
  
    SELECT
      2 AS order_id,
      102 AS customer_id,
      'P2' AS product_id
   UNION ALL
  
    SELECT
      3 AS order_id,
      101 AS customer_id,
      'P3' AS product_id
  
) AS UNUSED_TABLE_NAME  ),
t_2_Customers AS (SELECT * FROM (
  
    SELECT
      101 AS customer_id,
      'Alice' AS name
   UNION ALL
  
    SELECT
      102 AS customer_id,
      'Bob' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_3_Products AS (SELECT * FROM (
  
    SELECT
      'P1' AS product_id,
      100 AS price
   UNION ALL
  
    SELECT
      'P2' AS product_id,
      200 AS price
   UNION ALL
  
    SELECT
      'P3' AS product_id,
      150 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_0_OrderDetails AS (SELECT
  Orders.order_id AS order_id,
  Customers.name AS customer_name,
  Orders.product_id AS product_id,
  Products.price AS price
FROM
  t_1_Orders AS Orders, t_2_Customers AS Customers, t_3_Products AS Products
WHERE
  (Customers.customer_id = Orders.customer_id) AND
  (Products.product_id = Orders.product_id) ORDER BY order_id)
SELECT
  OrderDetails.order_id AS order_id,
  OrderDetails.customer_name AS customer_name,
  OrderDetails.price AS price
FROM
  t_0_OrderDetails AS OrderDetails ORDER BY order_id;