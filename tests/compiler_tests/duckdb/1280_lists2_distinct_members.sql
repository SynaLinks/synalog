-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  x_2.unnested_pod AS x
FROM
  t_1_L AS t_0_L, (select unnest(t_0_L.l) as unnested_pod) as x_2
GROUP BY x_2.unnested_pod ORDER BY x;
