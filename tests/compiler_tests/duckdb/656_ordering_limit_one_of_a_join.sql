-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'y' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'x' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k,
  A.v AS v
FROM
  t_0_A AS A, (select unnest([1, 2]) as unnested_pod) as x_6
WHERE
  (A.k IS NOT DISTINCT FROM x_6.unnested_pod) ORDER BY k LIMIT 1;