-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'a' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG({n: V.n} order by V.k) AS l
FROM
  t_4_V AS V)
SELECT
  array_extract(t_0_L.l,  CAST(0+1 AS BIGINT)).n AS n
FROM
  t_1_L AS t_0_L;