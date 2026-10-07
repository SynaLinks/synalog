-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_3_C AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'c' AS c
   UNION ALL
  
    SELECT
      2 AS k,
      'd' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_2_C.k AS k,
  'a' AS a,
  'b' AS b,
  t_2_C.c AS c
FROM
  t_3_C AS t_2_C
WHERE
  (1 = t_2_C.k);