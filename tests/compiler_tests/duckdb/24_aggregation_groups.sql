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
      'North' AS col0,
      'A' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'B' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'A' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'A' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'B' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'C' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'A' AS col1,
      300 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_TotalByRegion AS (SELECT
  Sales.col0 AS col0,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY Sales.col0)
SELECT
  TotalByRegion.col0 AS region,
  TotalByRegion.total AS total
FROM
  t_0_TotalByRegion AS TotalByRegion ORDER BY region;