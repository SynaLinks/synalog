WITH t_0_Sales AS (SELECT * FROM VALUES
  ("A", 100),
  ("A", 150),
  ("B", 200),
  ("C", 50)
AS UNUSED_TABLE_NAME(product, amount)),
t_1_AvgSale AS (SELECT
  SUM(t_2_Sales.amount) AS logica_value
FROM
  t_0_Sales AS t_2_Sales),
t_3_CountSales AS (SELECT
  SUM(1) AS logica_value
FROM
  t_0_Sales AS t_4_Sales)
SELECT
  Sales.product AS product,
  Sales.amount AS amount
FROM
  t_0_Sales AS Sales, t_1_AvgSale AS AvgSale, t_3_CountSales AS CountSales
WHERE
  (Sales.amount > ((AvgSale.logica_value) / NULLIF(CountSales.logica_value, 0))) ORDER BY product NULLS LAST;