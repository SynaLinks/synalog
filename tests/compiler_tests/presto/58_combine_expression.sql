WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'N' AS region,
      10 AS amount
   UNION ALL
  
    SELECT
      'N' AS region,
      20 AS amount
   UNION ALL
  
    SELECT
      'S' AS region,
      30 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  SUM(Sales.amount) AS logica_value
FROM
  t_0_Sales AS Sales) AS total ORDER BY total;