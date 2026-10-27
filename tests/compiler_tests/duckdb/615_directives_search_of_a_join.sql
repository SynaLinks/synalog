-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'paris' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'lyon' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k,
  A.c AS c
FROM
  t_0_A AS A, (select unnest([1, 2]) as unnested_pod) as x_6
WHERE
  (A.k IS NOT DISTINCT FROM x_6.unnested_pod) ORDER BY k;