-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS id,
      [5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      [7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  ),
t_1_All AS (SELECT
  ARRAY_AGG(x_2.unnested_pod) AS xs
FROM
  t_3_L AS t_2_L, (select unnest(t_2_L.l) as unnested_pod) as x_2)
SELECT
  LEN(t_0_All.xs) AS n
FROM
  t_1_All AS t_0_All;
