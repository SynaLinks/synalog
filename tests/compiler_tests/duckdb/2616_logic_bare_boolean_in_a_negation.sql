-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      true AS b,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS x,
      false AS b,
      'ba' AS s
   UNION ALL
  
    SELECT
      3 AS x,
      null AS b,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_V AS t_1_V, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    t_1_V.b AND
    (t_1_V.x = V.x)) IS NULL) ORDER BY x;