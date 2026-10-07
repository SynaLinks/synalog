-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      'b' AS w
   UNION ALL
  
    SELECT
      'a' AS w
   UNION ALL
  
    SELECT
      'B' AS w
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(V.w order by V.w) AS l
FROM
  t_4_V AS V)
SELECT
  ARRAY_TO_STRING(t_0_L.l, ',') AS s
FROM
  t_1_L AS t_0_L;