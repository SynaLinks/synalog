-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      10 AS x
   UNION ALL
  
    SELECT
      'de' AS c,
      20 AS x
   UNION ALL
  
    SELECT
      'ca' AS c,
      5 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_Region AS (SELECT * FROM (
  
    SELECT
      'fr' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'de' AS c,
      'eu' AS r
   UNION ALL
  
    SELECT
      'ca' AS c,
      'us' AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Region.r AS r,
  SUM(Sale.x) AS t
FROM
  t_0_Sale AS Sale, t_1_Region AS Region
WHERE
  (Region.c = Sale.c)
GROUP BY Region.r ORDER BY r;