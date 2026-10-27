-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Friend AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'a' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_3.unnested_pod AS name
FROM
  (select unnest(['a', 'b', 'c']) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_Friend AS Friend, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (Friend.a IS NOT DISTINCT FROM x_3.unnested_pod)) IS NULL) ORDER BY name;