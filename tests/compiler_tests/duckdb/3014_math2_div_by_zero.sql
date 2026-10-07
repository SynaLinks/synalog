-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      2 AS id,
      0 AS x,
      0 AS z
   UNION ALL
  
    SELECT
      3 AS id,
      7.5E0 AS x,
      2 AS z
   UNION ALL
  
    SELECT
      4 AS id,
      -7.5E0 AS x,
      2 AS z
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  CAST((CASE WHEN ((t_0_V.x) < 0) <> ((t_0_V.z) < 0) THEN CEIL(CAST(t_0_V.x AS DOUBLE) / NULLIF(t_0_V.z, 0)) ELSE FLOOR(CAST(t_0_V.x AS DOUBLE) / NULLIF(t_0_V.z, 0)) END) AS BIGINT) AS v
FROM
  t_1_V AS t_0_V ORDER BY id;