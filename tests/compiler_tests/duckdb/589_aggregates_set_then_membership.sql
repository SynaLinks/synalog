-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_V AS (SELECT * FROM (
  
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
      2 AS x
   UNION ALL
  
    SELECT
      'c' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_S AS (SELECT
  V.g AS g,
  ARRAY_AGG(DISTINCT V.x ORDER BY V.x) AS s
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_S.g AS g
FROM
  t_1_S AS t_0_S, (select unnest(t_0_S.s) as unnested_pod) as x_3
WHERE
  (2 = x_3.unnested_pod) ORDER BY g;