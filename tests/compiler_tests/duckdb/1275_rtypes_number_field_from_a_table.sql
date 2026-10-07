-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      'a' AS name,
      100 AS score
   UNION ALL
  
    SELECT
      'b' AS name,
      20 AS score
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  P.score AS score
FROM
  t_1_P AS P ORDER BY score;
