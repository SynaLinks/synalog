-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG({n: t_2_V.n, v: t_2_V.v}) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  x_1.unnested_pod.n AS n,
  x_1.unnested_pod.v AS v
FROM
  t_1_L AS t_0_L, (select unnest(t_0_L.l) as unnested_pod) as x_1 ORDER BY n;