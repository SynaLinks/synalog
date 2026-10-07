-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -3 AS x,
      null AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      'c' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'd' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'f' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  CASE WHEN (t_0_V.x IS null) THEN null WHEN (t_0_V.x < 0) THEN 0 WHEN (t_0_V.x < 3) THEN 1 WHEN (t_0_V.x < 6) THEN 2 WHEN (t_0_V.x < 9) THEN 3 WHEN (t_0_V.x < 12) THEN 4 ELSE 5 END AS v
FROM
  t_1_V AS t_0_V ORDER BY k;