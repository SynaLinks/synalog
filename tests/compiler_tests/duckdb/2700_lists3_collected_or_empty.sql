-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_3_V AS V
GROUP BY V.g),
t_5_G AS (SELECT * FROM (
  
    SELECT
      'a' AS g
   UNION ALL
  
    SELECT
      'b' AS g
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      C.g AS g,
      C.l AS l
    FROM
      t_2_C AS C
   UNION ALL
  
    SELECT
      t_4_G.g AS g,
      [] AS l
    FROM
      t_5_G AS t_4_G
    WHERE
      ((SELECT
        MIN((CASE WHEN x_14.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
      FROM
        t_2_C AS t_6_C, (select unnest([0]) as unnested_pod) as x_14
      WHERE
        (t_6_C.g = t_4_G.g)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.g AS g,
  LEN(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g;