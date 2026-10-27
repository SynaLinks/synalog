-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.id AS id,
  B.v AS v
FROM
  t_0_B AS B, (select unnest([1, 2]) as unnested_pod) as x_6
WHERE
  (B.id > 1) AND
  (x_6.unnested_pod IS NOT DISTINCT FROM B.id);