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
WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS x,
      'b' AS s
   UNION ALL
  
    SELECT
      3 AS x,
      'c' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT * FROM (
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (1 = N.x)
   UNION ALL
  
    SELECT
      N.x AS x,
      N.s AS s
    FROM
      t_0_N AS N
    WHERE
      (2 = N.x)
  
) AS UNUSED_TABLE_NAME  ORDER BY x ;