-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS k,
      2.5E0 AS x
   UNION ALL
  
    SELECT
      4 AS k,
      -2.5E0 AS x
   UNION ALL
  
    SELECT
      5 AS k,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS k,
      null AS x
   UNION ALL
  
    SELECT
      7 AS k,
      0.1E0 AS x
   UNION ALL
  
    SELECT
      8 AS k,
      -0.75E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_X.k AS k,
  (CASE WHEN t_0_X.x IS NULL OR 1 IS NULL OR -1 IS NULL THEN NULL ELSE GREATEST(t_0_X.x, 1, -1) END) AS v
FROM
  t_1_X AS t_0_X ORDER BY k;