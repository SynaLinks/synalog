-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      10 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      12 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.a AS a,
  V.b AS b,
  ((V.a) % NULLIF(V.b, 0)) AS r
FROM
  t_0_V AS V ORDER BY a;