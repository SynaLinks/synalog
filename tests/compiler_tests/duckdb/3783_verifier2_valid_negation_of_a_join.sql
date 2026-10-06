-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
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
  
) AS UNUSED_TABLE_NAME  ),
t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_N.n AS n
FROM
  t_1_N AS t_0_N
WHERE
  ((SELECT
    MIN((CASE WHEN x_7.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_E AS E, t_1_N AS t_2_N, (select unnest([0]) as unnested_pod) as x_7
  WHERE
    (E.a = t_0_N.n) AND
    (t_2_N.n = E.b)) IS NULL);