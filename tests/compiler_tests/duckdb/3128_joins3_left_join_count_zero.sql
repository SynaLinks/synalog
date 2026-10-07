-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS g,
      10 AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'a' AS g,
      20 AS v
   UNION ALL
  
    SELECT
      3 AS id,
      'b' AS g,
      null AS v
   UNION ALL
  
    SELECT
      4 AS id,
      null AS g,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
   UNION ALL
  
    SELECT
      'c' AS g
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_G.g AS g,
  COALESCE((SELECT
  SUM((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  t_1_E AS E, (select unnest([0]) as unnested_pod) as x_4
WHERE
  (E.g = t_0_G.g)), 0) AS n
FROM
  t_2_G AS t_0_G ORDER BY g;