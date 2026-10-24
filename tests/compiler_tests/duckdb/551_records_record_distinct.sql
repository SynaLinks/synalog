-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord356312844
drop type if exists synalogrecord356312844 cascade; create type synalogrecord356312844 as struct(a numeric);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      {a: 1} AS r
   UNION ALL
  
    SELECT
      {a: 1} AS r
  
) AS UNUSED_TABLE_NAME  ),
t_0_D AS (SELECT
  V.r AS r
FROM
  t_1_V AS V
GROUP BY V.r)
SELECT
  SUM(1) AS n
FROM
  t_0_D AS D;