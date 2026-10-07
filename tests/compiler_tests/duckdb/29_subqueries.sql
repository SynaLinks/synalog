-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
  (Sales.amount > ((AvgSale.logica_value) / NULLIF(CountSales.logica_value, 0))) ORDER BY product;