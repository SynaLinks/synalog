-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord848101342
drop type if exists logicarecord848101342 cascade; create type logicarecord848101342 as struct(a text, v double);

-- Logica type: logicarecord183863755
drop type if exists logicarecord183863755 cascade; create type logicarecord183863755 as struct(arg text, value double);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_2_Sales AS (SELECT * FROM (
  
    SELECT
      E'North' AS col0,
      E'Q1' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      E'North' AS col0,
      E'Q2' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      E'North' AS col0,
      E'Q3' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      E'South' AS col0,
      E'Q1' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      E'South' AS col0,
      E'Q2' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      E'South' AS col0,
      E'Q3' AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      E'East' AS col0,
      E'Q1' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      E'East' AS col0,
      E'Q2' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      E'East' AS col0,
      E'Q3' AS col1,
      95 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_BestQuarter AS (SELECT
  Sales.col0 AS col0,
  argmax(Sales.col1, Sales.col2) AS best_quarter
FROM
  t_2_Sales AS Sales
GROUP BY Sales.col0)
SELECT
  BestQuarter.col0 AS region,
  BestQuarter.best_quarter AS best_quarter
FROM
  t_0_BestQuarter AS BestQuarter ORDER BY region;