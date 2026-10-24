-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS "skip"
   UNION ALL
  
    SELECT
      2 AS "skip"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V."skip" AS "skip"
FROM
  t_0_V AS V ORDER BY "skip";