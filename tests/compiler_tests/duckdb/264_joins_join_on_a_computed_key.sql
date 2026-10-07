-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_B AS (SELECT * FROM (
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      5 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS a,
  t_1_B.k AS b
FROM
  t_2_B AS t_1_B
WHERE
  (t_1_B.k = ((1) + (1)));