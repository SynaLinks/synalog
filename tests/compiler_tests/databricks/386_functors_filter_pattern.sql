WITH t_0_Orders AS (SELECT * FROM VALUES
  ("John", 10),
  ("John", 20),
  ("Mary", 5)
AS UNUSED_TABLE_NAME(customer_name, amount))
SELECT
  Orders.customer_name AS customer_name,
  SUM(Orders.amount) AS revenue
FROM
  t_0_Orders AS Orders
WHERE
  ("John" = Orders.customer_name)
GROUP BY 1 ORDER BY customer_name NULLS LAST;