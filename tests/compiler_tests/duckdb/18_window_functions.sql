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
      1 AS col0,
      'East' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'East' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'East' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      1 AS col0,
      'West' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      2 AS col0,
      'West' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      3 AS col0,
      'West' AS col1,
      220 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_RegionalTotal AS (SELECT
  Sales.col1 AS region,
  SUM(Sales.col2) AS total
FROM
  t_1_Sales AS Sales
GROUP BY Sales.col1)
SELECT
  RegionalTotal.region AS region,
  RegionalTotal.total AS total
FROM
  t_0_RegionalTotal AS RegionalTotal ORDER BY region;