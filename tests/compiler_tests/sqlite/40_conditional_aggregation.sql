WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      'Electronics' AS category,
      500 AS amount
   UNION ALL
  
    SELECT
      'Electronics' AS category,
      300 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      50 AS amount
   UNION ALL
  
    SELECT
      'Books' AS category,
      75 AS amount
   UNION ALL
  
    SELECT
      'Clothing' AS category,
      200 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_CategorySummary AS (SELECT
  Sales.category AS category,
  SUM(Sales.amount) AS total,
  SUM(CASE WHEN (Sales.amount >= 200) THEN 1 ELSE 0 END) AS high_value_count
FROM
  t_1_Sales AS Sales
GROUP BY Sales.category ORDER BY category)
SELECT
  CategorySummary.category AS category,
  CategorySummary.total AS total,
  CategorySummary.high_value_count AS high_value_count
FROM
  t_0_CategorySummary AS CategorySummary ORDER BY category;