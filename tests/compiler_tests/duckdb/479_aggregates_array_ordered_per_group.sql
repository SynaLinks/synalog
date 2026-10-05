-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      2 AS k,
      1 AS v
   UNION ALL
  
    SELECT
      'x' AS g,
      1 AS k,
      2 AS v
   UNION ALL
  
    SELECT
      'y' AS g,
      5 AS k,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.g AS g,
  ARRAY_AGG(t_0_V.v order by t_0_V.k) AS l
FROM
  t_2_V AS t_0_V
GROUP BY t_0_V.g ORDER BY g;