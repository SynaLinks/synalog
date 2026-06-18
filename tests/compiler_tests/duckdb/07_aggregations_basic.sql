-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Sales AS (SELECT * FROM (
  
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
      'B' AS product,
      50 AS amount
   UNION ALL
  
    SELECT
      'C' AS product,
      300 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_TotalByProduct AS (SELECT
  Sales.product AS product,
  SUM(Sales.amount) AS total
FROM
  t_1_Sales AS Sales
GROUP BY Sales.product),
t_2_CountByProduct AS (SELECT
  t_3_Sales.product AS product,
  SUM(1) AS count
FROM
  t_1_Sales AS t_3_Sales
GROUP BY t_3_Sales.product),
t_4_MinByProduct AS (SELECT
  t_5_Sales.product AS product,
  MIN(t_5_Sales.amount) AS min_amount
FROM
  t_1_Sales AS t_5_Sales
GROUP BY t_5_Sales.product),
t_6_MaxByProduct AS (SELECT
  t_7_Sales.product AS product,
  MAX(t_7_Sales.amount) AS max_amount
FROM
  t_1_Sales AS t_7_Sales
GROUP BY t_7_Sales.product)
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