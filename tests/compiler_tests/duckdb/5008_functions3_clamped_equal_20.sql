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
  V.k AS k
FROM
  t_1_V AS V
WHERE
  ((CASE WHEN 0 IS NULL OR (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN V.x IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(V.x, 5) END)) END) = (CASE WHEN 0 IS NULL OR (CASE WHEN 20 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(20, 5) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN 20 IS NULL OR 5 IS NULL THEN NULL ELSE LEAST(20, 5) END)) END)) ORDER BY k;