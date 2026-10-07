WITH t_0_Sales AS (SELECT * FROM VALUES
  ("N", 10),
  ("N", 20),
  ("S", 30)
AS UNUSED_TABLE_NAME(region, amount))
SELECT
  (SELECT
  SUM(Sales.amount) AS logica_value
FROM
  t_0_Sales AS Sales) AS total ORDER BY total NULLS LAST;