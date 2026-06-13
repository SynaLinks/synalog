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
      E'North' AS region,
      E'A' AS product,
      100 AS amount
   UNION ALL
  
    SELECT
      E'North' AS region,
      E'B' AS product,
      150 AS amount
   UNION ALL
  
    SELECT
      E'South' AS region,
      E'A' AS product,
      200 AS amount
   UNION ALL
  
    SELECT
      E'South' AS region,
      E'B' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      E'East' AS region,
      E'A' AS product,
      300 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_RegionStats AS (SELECT
  Sales.region AS region,
  SUM(Sales.amount) AS total,
  SUM(1) AS count,
  MAX(Sales.amount) AS max_sale,
  MIN(Sales.amount) AS min_sale
FROM
  t_1_Sales AS Sales
GROUP BY Sales.region ORDER BY region)
SELECT
  RegionStats.region AS region,
  RegionStats.total AS total,
  RegionStats.count AS count,
  RegionStats.max_sale AS max_sale,
  RegionStats.min_sale AS min_sale
FROM
  t_0_RegionStats AS RegionStats ORDER BY region;