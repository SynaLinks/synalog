-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      {k: 2} AS r
   UNION ALL
  
    SELECT
      {k: 1} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.r.k AS k
FROM
  t_1_R AS t_0_R ORDER BY k;