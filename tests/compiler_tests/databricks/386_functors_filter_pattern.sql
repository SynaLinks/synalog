WITH t_0_Orders AS (SELECT * FROM (
  
    SELECT
      "John" AS customer_name,
      10 AS amount
   UNION ALL
  
    SELECT
      "John" AS customer_name,
      20 AS amount
   UNION ALL
  
    SELECT
      "Mary" AS customer_name,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Orders.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Orders AS Orders
WHERE
  ("John" = Orders.customer_name)
GROUP BY 1 ORDER BY customer_name;