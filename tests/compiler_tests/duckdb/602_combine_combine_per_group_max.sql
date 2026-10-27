-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  V.x AS x,
  (SELECT
  MAX((CASE WHEN x_9.unnested_pod = 0 THEN t_0_V.x ELSE NULL END)) AS synalog_value
FROM
  t_1_V AS t_0_V, (select unnest([0]) as unnested_pod) as x_9
WHERE
  (t_0_V.g IS NOT DISTINCT FROM V.g)) AS m
FROM
  t_1_V AS V ORDER BY g, x;