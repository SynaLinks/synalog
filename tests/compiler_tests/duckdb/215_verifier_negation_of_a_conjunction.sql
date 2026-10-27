-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_7.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_B AS B, (select unnest([0]) as unnested_pod) as x_7
  WHERE
    (B.x IS NOT DISTINCT FROM x_3.unnested_pod) AND
    (x_3.unnested_pod = 2)) IS NULL) ORDER BY x;