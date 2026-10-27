-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      9 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_4.unnested_pod AS x
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_4
WHERE
  ((SELECT
    MIN((CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_E AS E, (select unnest([0]) as unnested_pod) as x_8
  WHERE
    (E.b > 5) AND
    (E.a IS NOT DISTINCT FROM x_4.unnested_pod)) IS NULL) ORDER BY x;