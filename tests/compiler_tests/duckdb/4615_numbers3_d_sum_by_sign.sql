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
  CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END AS s,
  SUM(t_0_X.x) AS t
FROM
  t_1_X AS t_0_X
GROUP BY CASE WHEN (t_0_X.x > 0) THEN 1 WHEN (t_0_X.x < 0) THEN -1 ELSE 0 END ORDER BY s;