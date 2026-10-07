-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      2.5E0 AS x
   UNION ALL
  
    SELECT
      1000000 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(((((t_0_V.x) * (t_0_V.x))) * (2.5E0))) AS v
FROM
  t_1_V AS t_0_V;