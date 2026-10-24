WITH t_0_Sales AS (SELECT * FROM VALUES
  ("A", 100),
  ("A", 150),
  ("B", 200),
  ("C", 50)
AS UNUSED_TABLE_NAME(product, amount)),
t_1_AvgSale AS (SELECT
  SUM(t_2_Sales.amount) AS synalog_value
FROM
  t_0_Sales AS t_2_Sales),
t_3_CountSales AS (SELECT
  SUM(1) AS synalog_value
FROM
  t_0_Sales AS t_4_Sales)
SELECT
  Sales.product AS product,
  Sales.amount AS amount
FROM
  t_0_Sales AS Sales, t_1_AvgSale AS AvgSale, t_3_CountSales AS CountSales
WHERE
  (Sales.amount > ((AvgSale.synalog_value) / NULLIF(CountSales.synalog_value, 0))) ORDER BY product NULLS LAST;