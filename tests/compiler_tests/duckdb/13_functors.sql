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
WITH t_1_Events1 AS (SELECT * FROM (
  
    SELECT
      E'A' AS category,
      10 AS count
   UNION ALL
  
    SELECT
      E'A' AS category,
      20 AS count
   UNION ALL
  
    SELECT
      E'B' AS category,
      15 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total1 AS (SELECT
  Events1.category AS category,
  SUM(Events1.count) AS total
FROM
  t_1_Events1 AS Events1
GROUP BY Events1.category),
t_1_Events2 AS (SELECT * FROM (
  
    SELECT
      E'B' AS category,
      5 AS count
   UNION ALL
  
    SELECT
      E'C' AS category,
      25 AS count
   UNION ALL
  
    SELECT
      E'C' AS category,
      30 AS count
  
) AS UNUSED_TABLE_NAME  ),
t_0_Total2 AS (SELECT
  Events2.category AS category,
  SUM(Events2.count) AS total
FROM
  t_1_Events2 AS Events2
GROUP BY Events2.category)
SELECT * FROM (
  
    SELECT
      E'events1' AS source,
      Total1.category AS category,
      Total1.total AS total
    FROM
      t_0_Total1 AS Total1
   UNION ALL
  
    SELECT
      E'events2' AS source,
      Total2.category AS category,
      Total2.total AS total
    FROM
      t_0_Total2 AS Total2
  
) AS UNUSED_TABLE_NAME  ORDER BY source, category ;