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
  SUM(MagicalEntangle(Sales.amount, x_6.value)) AS logica_value
FROM
  t_0_Sales AS Sales, JSON_EACH(JSON_ARRAY(0)) as x_6) AS total ORDER BY total;