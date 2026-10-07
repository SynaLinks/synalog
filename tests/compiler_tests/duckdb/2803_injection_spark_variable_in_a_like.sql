-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '${a}b' AS s
   UNION ALL
  
    SELECT
      2 AS id,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (V.s LIKE '${a}%' ESCAPE '\');