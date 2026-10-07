-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_P1 AS (SELECT
  ((((x_2.unnested_pod) * (17))) % NULLIF(39, 0)) AS col0
FROM
  (select unnest(Range(10)) as unnested_pod) as x_2 ORDER BY col0),
t_0_P2 AS (SELECT
  x_5.unnested_pod AS col0
FROM
  (select unnest(Range(20)) as unnested_pod) as x_5 LIMIT 5),
t_0_P3 AS (SELECT
  x_5.unnested_pod AS col0
FROM
  (select unnest(Range(20)) as unnested_pod) as x_5
WHERE
  (((x_5.unnested_pod) % NULLIF(2, 0)) = 0) ORDER BY col0 LIMIT 3)
SELECT * FROM (
  
    SELECT
      'ordered' AS col0,
      P1.col0 AS col1
    FROM
      t_0_P1 AS P1
   UNION ALL
  
    SELECT
      'limited' AS col0,
      P2.col0 AS col1
    FROM
      t_0_P2 AS P2
   UNION ALL
  
    SELECT
      'both' AS col0,
      P3.col0 AS col1
    FROM
      t_0_P3 AS P3
  
) AS UNUSED_TABLE_NAME  ORDER BY col0, col1 ;