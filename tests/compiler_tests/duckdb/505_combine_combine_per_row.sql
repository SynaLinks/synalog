-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
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
      4 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT
  t_3_V.g AS g
FROM
  t_1_V AS t_3_V
GROUP BY t_3_V.g)
SELECT
  t_0_G.g AS g,
  (SELECT
  SUM((CASE WHEN x_7.unnested_pod = 0 THEN V.x ELSE NULL END)) AS logica_value
FROM
  t_1_V AS V, (select unnest([0]) as unnested_pod) as x_7
WHERE
  (V.g = t_0_G.g)) AS t
FROM
  t_2_G AS t_0_G ORDER BY g;