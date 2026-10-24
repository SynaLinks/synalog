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
WITH t_0_JsonData AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      30 AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      25 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JsonData.col0 AS col0,
  JsonData.col1 AS col1
FROM
  t_0_JsonData AS JsonData ORDER BY col0;