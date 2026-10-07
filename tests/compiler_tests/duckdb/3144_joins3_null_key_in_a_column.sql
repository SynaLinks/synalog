-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_A AS (SELECT * FROM (
  
    SELECT
      null AS k,
      1 AS a
   UNION ALL
  
    SELECT
      5 AS k,
      2 AS a
   UNION ALL
  
    SELECT
      null AS k,
      3 AS a
  
) AS UNUSED_TABLE_NAME  ),
t_3_B AS (SELECT * FROM (
  
    SELECT
      null AS k,
      10 AS b
   UNION ALL
  
    SELECT
      5 AS k,
      20 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_A.a AS a,
  t_1_B.b AS b
FROM
  t_2_A AS t_0_A, t_3_B AS t_1_B
WHERE
  (t_1_B.k = t_0_A.k);