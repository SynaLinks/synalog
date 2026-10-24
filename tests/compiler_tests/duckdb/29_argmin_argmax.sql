-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord183863755
drop type if exists synalogrecord183863755 cascade; create type synalogrecord183863755 as struct(arg text, value numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord848101342
drop type if exists synalogrecord848101342 cascade; create type synalogrecord848101342 as struct(a text, v numeric);
WITH t_2_Sales AS (SELECT * FROM (
  
    SELECT
      'North' AS col0,
      'Q1' AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q2' AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      'North' AS col0,
      'Q3' AS col1,
      120 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q1' AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q2' AS col1,
      180 AS col2
   UNION ALL
  
    SELECT
      'South' AS col0,
      'Q3' AS col1,
      220 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q1' AS col1,
      90 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q2' AS col1,
      110 AS col2
   UNION ALL
  
    SELECT
      'East' AS col0,
      'Q3' AS col1,
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