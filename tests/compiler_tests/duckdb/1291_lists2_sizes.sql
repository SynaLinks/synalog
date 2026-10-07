-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_L AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      [3, 1, 2] AS l
   UNION ALL
  
    SELECT
      2 AS id,
      [] AS l
   UNION ALL
  
    SELECT
      3 AS id,
      [5] AS l
   UNION ALL
  
    SELECT
      4 AS id,
      [7, 7, 8, 9] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.id AS id,
  LEN(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY id, n;
