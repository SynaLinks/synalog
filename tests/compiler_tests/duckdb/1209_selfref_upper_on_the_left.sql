-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_C AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ab' AS last
   UNION ALL
  
    SELECT
      2 AS id,
      'AB' AS last
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C.id AS id
FROM
  t_0_C AS C
WHERE
  (UPPER(C.last) IS NOT DISTINCT FROM C.last);