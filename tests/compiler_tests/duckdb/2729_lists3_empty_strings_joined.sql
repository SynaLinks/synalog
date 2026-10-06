-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_S AS (SELECT * FROM (
  
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
  t_0_S.k AS k,
  ARRAY_TO_STRING(t_0_S.l, '+') AS s
FROM
  t_1_S AS t_0_S ORDER BY k;