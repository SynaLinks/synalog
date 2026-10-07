-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS n
   UNION ALL
  
    SELECT
      'x' AS g,
      2 AS n
   UNION ALL
  
    SELECT
      'y' AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  ARRAY_AGG({n: V.n}) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, (select unnest(t_0_C.l) as unnested_pod) as x_3
WHERE
  (x_3.unnested_pod.n > 0)
GROUP BY t_0_C.g ORDER BY g;