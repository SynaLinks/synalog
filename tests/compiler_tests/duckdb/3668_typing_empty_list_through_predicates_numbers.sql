-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      [] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      [1, 2] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.k AS k,
  LEN(B.l) AS n
FROM
  t_0_B AS B ORDER BY k;