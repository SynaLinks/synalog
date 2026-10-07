WITH t_1_Sales AS (SELECT * FROM VALUES
  ("Electronics", 500),
  ("Electronics", 300),
  ("Books", 50),
  ("Books", 75),
  ("Clothing", 200)
AS UNUSED_TABLE_NAME(category, amount)),
t_0_CategorySummary AS (SELECT
  Sales.category AS category,
  SUM(Sales.amount) AS total,
  SUM(CASE WHEN (Sales.amount >= 200) THEN 1 ELSE 0 END) AS high_value_count
FROM
  t_1_Sales AS Sales
GROUP BY 1 ORDER BY category NULLS LAST)
SELECT
  CategorySummary.category AS category,
  CategorySummary.total AS total,
  CategorySummary.high_value_count AS high_value_count
FROM
  t_0_CategorySummary AS CategorySummary ORDER BY category NULLS LAST;