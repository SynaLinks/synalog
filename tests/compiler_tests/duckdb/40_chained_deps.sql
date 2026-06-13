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
WITH t_1_RawData AS (SELECT * FROM (
  
    SELECT
      1 AS col0,
      10 AS col1
   UNION ALL
  
    SELECT
      2 AS col0,
      20 AS col1
   UNION ALL
  
    SELECT
      3 AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      4 AS col0,
      40 AS col1
   UNION ALL
  
    SELECT
      5 AS col0,
      50 AS col1
  
) AS UNUSED_TABLE_NAME  ),
t_0_Aggregated AS (SELECT
  SUM(((RawData.col1) * (2))) AS total,
  SUM(1) AS count
FROM
  t_1_RawData AS RawData
WHERE
  (RawData.col1 > 15))
SELECT
  Aggregated.total AS total,
  Aggregated.count AS count,
  ((Aggregated.total) / (Aggregated.count)) AS avg
FROM
  t_0_Aggregated AS Aggregated ORDER BY total;