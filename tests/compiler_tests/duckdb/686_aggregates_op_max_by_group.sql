-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      x_4.unnested_pod AS x
    FROM
      (select unnest([4, 1, 7, 1]) as unnested_pod) as x_4
   UNION ALL
  
    SELECT
      'b' AS g,
      5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MAX(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY t_0_V.g ORDER BY g;