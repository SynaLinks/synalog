-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_WithNull AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_WithNull AS WithNull
WHERE
  (WithNull.x IS null);