-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_M AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  M.k AS k,
  SUM(1) AS n
FROM
  t_1_M AS M, (select unnest([1, 2]) as unnested_pod) as x_4
WHERE
  (x_4.unnested_pod IS NOT DISTINCT FROM M.k)
GROUP BY M.k ORDER BY k;