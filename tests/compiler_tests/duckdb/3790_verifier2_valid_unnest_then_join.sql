-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_N AS (SELECT * FROM (
  
    SELECT
      1 AS n,
      'x' AS s
   UNION ALL
  
    SELECT
      2 AS n,
      'y' AS s
   UNION ALL
  
    SELECT
      3 AS n,
      'z' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2.unnested_pod AS n,
  t_0_N.s AS s
FROM
  t_1_N AS t_0_N, (select unnest([2, 3]) as unnested_pod) as x_2
WHERE
  (t_0_N.n IS NOT DISTINCT FROM x_2.unnested_pod) ORDER BY n;