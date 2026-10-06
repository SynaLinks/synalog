-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      [1, 2, 3] AS l
   UNION ALL
  
    SELECT
      'b' AS k,
      [10] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.k AS k,
  SUM(x_3.unnested_pod) AS t
FROM
  t_1_L AS t_0_L, (select unnest(t_0_L.l) as unnested_pod) as x_3
GROUP BY t_0_L.k ORDER BY k, t;