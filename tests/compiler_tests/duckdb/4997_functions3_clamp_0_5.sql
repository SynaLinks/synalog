-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  (CASE WHEN 0 IS NULL OR (CASE WHEN t_0_V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(t_0_V.x, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN t_0_V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(t_0_V.x, 5) END)) END) AS v
FROM
  t_1_V AS t_0_V ORDER BY k;