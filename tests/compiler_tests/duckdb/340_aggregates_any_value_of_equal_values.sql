-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'g' AS g,
      7 AS x
   UNION ALL
  
    SELECT
      'g' AS g,
      7 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  MIN(t_0_V.x) AS v
FROM
  t_1_V AS t_0_V
GROUP BY t_0_V.g;