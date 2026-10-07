-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ['a', 'b'] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS k,
      null AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  (CASE WHEN 0 < 0 THEN NULL ELSE array_extract(S.l, CAST(0 + 1 AS BIGINT)) END) AS e
FROM
  t_0_S AS S ORDER BY k;