-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS k,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_V.x) AS t
FROM
  t_1_V AS t_3_V)
SELECT
  V.k AS k,
  ROUND(((100) * (((V.x) / (t_0_T.t)))), 2) AS pct
FROM
  t_1_V AS V, t_2_T AS t_0_T ORDER BY k;
