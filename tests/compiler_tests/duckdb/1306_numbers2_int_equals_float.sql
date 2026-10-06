-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      -7 AS x
   UNION ALL
  
    SELECT
      -2 AS x
   UNION ALL
  
    SELECT
      0 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      12 AS x
   UNION ALL
  
    SELECT
      1099511627776 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.x AS x
FROM
  t_0_N AS N
WHERE
  (N.x = 3.0E0);