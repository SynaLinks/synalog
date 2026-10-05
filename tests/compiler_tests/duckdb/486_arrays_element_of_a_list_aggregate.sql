-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(t_2_V.v order by t_2_V.k) AS l
FROM
  t_4_V AS t_2_V)
SELECT
  array_extract(t_0_L.l,  CAST(0+1 AS BIGINT)) AS first
FROM
  t_1_L AS t_0_L;