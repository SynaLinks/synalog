WITH t_1_Sales AS (SELECT * FROM (
  
    SELECT
      "A" AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      "A" AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      "B" AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      "B" AS product,
      50 AS amount
   UNION ALL
  
    SELECT
      "C" AS product,
      300 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_TotalByProduct AS (SELECT
  Sales.product AS product,
  SUM(Sales.amount) AS total
FROM
  t_1_Sales AS Sales
GROUP BY 1),
t_2_CountByProduct AS (SELECT
  t_3_Sales.product AS product,
  SUM(1) AS count
FROM
  t_1_Sales AS t_3_Sales
GROUP BY 1),
t_4_MinByProduct AS (SELECT
  t_5_Sales.product AS product,
  MIN(t_5_Sales.amount) AS min_amount
FROM
  t_1_Sales AS t_5_Sales
GROUP BY 1),
t_6_MaxByProduct AS (SELECT
  t_7_Sales.product AS product,
  MAX(t_7_Sales.amount) AS max_amount
FROM
  t_1_Sales AS t_7_Sales
GROUP BY 1)
SELECT
  TotalByProduct.product AS product,
  TotalByProduct.total AS total,
  CountByProduct.count AS count,
  MinByProduct.min_amount AS min_amount,
  MaxByProduct.max_amount AS max_amount
FROM
  t_0_TotalByProduct AS TotalByProduct, t_2_CountByProduct AS CountByProduct, t_4_MinByProduct AS MinByProduct, t_6_MaxByProduct AS MaxByProduct
WHERE
  (CountByProduct.product = TotalByProduct.product) AND
  (MinByProduct.product = TotalByProduct.product) AND
  (MaxByProduct.product = TotalByProduct.product) ORDER BY product;