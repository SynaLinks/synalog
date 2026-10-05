WITH t_2_Orders AS (SELECT * FROM (
  
    SELECT
      'John' AS customer_name,
      10 AS amount
   UNION ALL
  
    SELECT
      'John' AS customer_name,
      20 AS amount
   UNION ALL
  
    SELECT
      'Mary' AS customer_name,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_Filter AS (SELECT
  t_1_Orders.customer_name AS customer_name
FROM
  t_2_Orders AS t_1_Orders
GROUP BY 1)
SELECT
  Filter.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Filter AS Filter, t_2_Orders AS Orders
WHERE
  (Orders.customer_name = Filter.customer_name)
GROUP BY 1 ORDER BY customer_name;