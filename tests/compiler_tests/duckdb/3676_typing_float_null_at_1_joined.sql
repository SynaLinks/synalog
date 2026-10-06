-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_K AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      3 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      2.5E0 AS v
   UNION ALL
  
    SELECT
      2 AS k,
      null AS v
   UNION ALL
  
    SELECT
      3 AS k,
      0.25E0 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_K.k AS k,
  t_1_V.v AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k) ORDER BY k;