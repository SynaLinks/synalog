-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [{n: 'a', v: 1}, {n: 'b', v: 2}] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [{n: 'c', v: 3}] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(T.l, CAST(0 + 1 AS BIGINT)) END).n AS n
FROM
  t_0_T AS T ORDER BY k;