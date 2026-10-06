-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      4 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x,
  CASE WHEN (((V.x) % NULLIF(2, 0)) = 0) THEN ((V.x) / NULLIF(2, 0)) ELSE null END AS h
FROM
  t_0_V AS V ORDER BY x;