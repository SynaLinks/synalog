-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      null AS v
   UNION ALL
  
    SELECT
      7 AS v
   UNION ALL
  
    SELECT
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(t_0_V.v) AS m
FROM
  t_1_V AS t_0_V;