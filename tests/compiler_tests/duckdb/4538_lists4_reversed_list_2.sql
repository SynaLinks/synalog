-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_L AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      [7] AS l
   UNION ALL
  
    SELECT
      4 AS k,
      [5, 5, 9, 1] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(x_4.unnested_pod order by - x_4.unnested_pod) AS s
FROM
  t_3_L AS t_0_L, (select unnest(t_0_L.l) as unnested_pod) as x_4
WHERE
  (t_0_L.k = 2);