-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (((E.a) % NULLIF(2, 0)) = 1) AS odd,
  SUM(1) AS n
FROM
  t_0_E AS E
GROUP BY (((E.a) % NULLIF(2, 0)) = 1) ORDER BY odd;