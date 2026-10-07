-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_Values AS (SELECT * FROM (
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_Values.a AS a,
  t_0_Values.b AS b,
  ((((t_0_Values.a) * (t_0_Values.a))) + (((t_0_Values.b) * (t_0_Values.b)))) AS result
FROM
  t_2_Values AS t_0_Values ORDER BY a;