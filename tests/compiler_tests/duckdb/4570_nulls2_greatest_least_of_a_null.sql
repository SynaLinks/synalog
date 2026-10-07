-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Gv AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      null AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Gv.a AS a,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE GREATEST(Gv.a, Gv.b) END) AS g,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE LEAST(Gv.a, Gv.b) END) AS l,
  (CASE WHEN Gv.a IS NULL OR 2.5E0 IS NULL OR COALESCE(Gv.b, 0) IS NULL THEN NULL ELSE GREATEST(Gv.a, 2.5E0, COALESCE(Gv.b, 0)) END) AS h
FROM
  t_0_Gv AS Gv ORDER BY a;