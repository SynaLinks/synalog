-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'x' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  t_0_V.v AS v
FROM
  t_1_V AS t_0_V ORDER BY k;