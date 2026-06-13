WITH t_0_Sales AS (SELECT * FROM (
  
    SELECT
      'A' AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      'A' AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      'B' AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      'C' AS product,
      50 AS amount
  
) AS UNUSED_TABLE_NAME  ),
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
  (Sales.amount > ((AvgSale.logica_value) / (CountSales.logica_value))) ORDER BY product;