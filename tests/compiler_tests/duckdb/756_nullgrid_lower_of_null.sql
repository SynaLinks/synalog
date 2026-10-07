-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'ab' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  CASE WHEN (t_0_V.k = 1) THEN CASE WHEN (LOWER(t_0_V.s) IS NULL) THEN null ELSE 'bad' END ELSE 'ok' END AS v
FROM
  t_1_V AS t_0_V ORDER BY k;