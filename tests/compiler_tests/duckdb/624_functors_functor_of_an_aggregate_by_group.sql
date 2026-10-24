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
WITH t_1_In1 AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      3 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_0_T1 AS (SELECT
  In1.g AS g,
  SUM(In1.v) AS t
FROM
  t_1_In1 AS In1
GROUP BY In1.g)
SELECT
  T1.g AS g,
  T1.t AS t
FROM
  t_0_T1 AS T1 ORDER BY g;