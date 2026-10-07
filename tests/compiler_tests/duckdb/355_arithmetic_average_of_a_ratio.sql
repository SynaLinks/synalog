-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(((V.a) / NULLIF(V.b, 0))) AS r
FROM
  t_0_V AS V;