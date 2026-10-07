-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_W AS (SELECT * FROM (
  
    SELECT
      'alpha' AS w
   UNION ALL
  
    SELECT
      'beta' AS w
   UNION ALL
  
    SELECT
      'gamma' AS w
   UNION ALL
  
    SELECT
      'delta' AS w
   UNION ALL
  
    SELECT
      'epsilon' AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W ORDER BY w;