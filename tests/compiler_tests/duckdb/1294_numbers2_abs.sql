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
      -7 AS x
   UNION ALL
  
    SELECT
      -2 AS x
   UNION ALL
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      12 AS x
   UNION ALL
  
    SELECT
      1099511627776 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.x AS x,
  ABS(N.x) AS a
FROM
  t_0_N AS N ORDER BY x, a;